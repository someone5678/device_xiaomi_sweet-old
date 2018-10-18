/*
 * Copyright (C) 2020 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define ATRACE_TAG (ATRACE_TAG_POWER | ATRACE_TAG_HAL)
#define LOG_TAG "android.hardware.power-service.sweet-libperfmgr"

#include "Power.h"

#include <mutex>

#include <android-base/file.h>
#include <android-base/logging.h>
#include <android-base/properties.h>
#include <android-base/strings.h>

#include <utils/Log.h>
#include <utils/Trace.h>

#include <sys/ioctl.h>

#define SET_CUR_VALUE 0
#define TOUCH_DEV_PATH "/dev/xiaomi-touch"

#define TOUCH_MAGIC 0x5400
#define TOUCH_IOC_SETMODE TOUCH_MAGIC + SET_CUR_VALUE

#define Touch_Doubletap_Mode 14

namespace aidl {
namespace android {
namespace hardware {
namespace power {
namespace impl {
namespace pixel {

constexpr char kPowerHalStateProp[] = "vendor.powerhal.state";
constexpr char kPowerHalInitProp[] = "vendor.powerhal.init";
constexpr char kPowerHalRenderingProp[] = "vendor.powerhal.rendering";
constexpr char kPowerHalConfigPath[] = "/vendor/etc/powerhint.json";

Power::Power()
    : mHintManager(nullptr),
      mSustainedPerfModeOn(false),
      mReady(false) {
    // Parse config but do not start the looper
    mHintManager = HintManager::GetFromJSON(kPowerHalConfigPath, false);
    if (!mHintManager) {
        LOG(FATAL) << "Invalid config: " << kPowerHalConfigPath;
    }

    std::thread initThread([this]() {
        ::android::base::WaitForProperty(kPowerHalInitProp, "1");
        mHintManager->Start();

        std::string state = ::android::base::GetProperty(kPowerHalStateProp, "");
        if (state == "SUSTAINED_PERFORMANCE") {
            ALOGI("Initialize with SUSTAINED_PERFORMANCE on");
            mHintManager->DoHint("SUSTAINED_PERFORMANCE");
            mSustainedPerfModeOn = true;
        } else {
            ALOGI("Initialize PowerHAL");
        }

        state = ::android::base::GetProperty(kPowerHalRenderingProp, "");
        if (state == "EXPENSIVE_RENDERING") {
            ALOGI("Initialize with EXPENSIVE_RENDERING on");
            mHintManager->DoHint("EXPENSIVE_RENDERING");
        }

        // Now start to take powerhint
        mReady.store(true);
        ALOGI("PowerHAL ready to process hints");
    });
    initThread.detach();
}

ndk::ScopedAStatus Power::setMode(Mode type, bool enabled) {
    if (!mReady) {
        return ndk::ScopedAStatus::ok();
    }
    LOG(DEBUG) << "Power setMode: " << toString(type) << " to: " << enabled;
    ATRACE_INT(toString(type).c_str(), enabled);
    switch (type) {
        case Mode::LOW_POWER:
            break;
        case Mode::SUSTAINED_PERFORMANCE:
            if (enabled) {
                mHintManager->DoHint("SUSTAINED_PERFORMANCE");
            }
            mSustainedPerfModeOn = true;
            break;
        case Mode::DOUBLE_TAP_TO_WAKE: {
            int fd = open(TOUCH_DEV_PATH, O_RDWR);
            int arg[2] = {Touch_Doubletap_Mode, enabled ? 1 : 0};
            ioctl(fd, TOUCH_IOC_SETMODE, &arg);
            break;
        }
        case Mode::LAUNCH:
            if (mSustainedPerfModeOn) {
                break;
            }
            [[fallthrough]];
        case Mode::FIXED_PERFORMANCE:
            [[fallthrough]];
        case Mode::EXPENSIVE_RENDERING:
            [[fallthrough]];
        case Mode::INTERACTIVE:
            [[fallthrough]];
        case Mode::DEVICE_IDLE:
            [[fallthrough]];
        case Mode::DISPLAY_INACTIVE:
            [[fallthrough]];
        default:
            if (enabled) {
                mHintManager->DoHint(toString(type));
            } else {
                mHintManager->EndHint(toString(type));
            }
            break;
    }

    return ndk::ScopedAStatus::ok();
}

ndk::ScopedAStatus Power::isModeSupported(Mode type, bool *_aidl_return) {
    bool supported;

    switch(type) {
        case Mode::DOUBLE_TAP_TO_WAKE:
            supported = true;
            break;
        default:
            supported = mHintManager->IsHintSupported(toString(type));
            break;
    }

    LOG(INFO) << "Power mode " << toString(type) << " isModeSupported: " << supported;
    *_aidl_return = supported;
    return ndk::ScopedAStatus::ok();
}

ndk::ScopedAStatus Power::setBoost(Boost type, int32_t durationMs) {
    if (!mReady) {
        return ndk::ScopedAStatus::ok();
    }
    LOG(DEBUG) << "Power setBoost: " << toString(type) << " duration: " << durationMs;
    ATRACE_INT(toString(type).c_str(), durationMs);
    switch (type) {
        case Boost::INTERACTION:
        case Boost::DISPLAY_UPDATE_IMMINENT:
        case Boost::ML_ACC:
            [[fallthrough]];
        default:
            if (durationMs > 0) {
                mHintManager->DoHint(toString(type), std::chrono::milliseconds(durationMs));
            } else if (durationMs == 0) {
                mHintManager->DoHint(toString(type));
            } else {
                mHintManager->EndHint(toString(type));
            }
            break;
    }

    return ndk::ScopedAStatus::ok();
}

ndk::ScopedAStatus Power::isBoostSupported(Boost type, bool *_aidl_return) {
    bool supported = mHintManager->IsHintSupported(toString(type));
    LOG(INFO) << "Power mode " << toString(type) << " isBoostSupported: " << supported;
    *_aidl_return = supported;
    return ndk::ScopedAStatus::ok();
}

}  // namespace pixel
}  // namespace impl
}  // namespace power
}  // namespace hardware
}  // namespace android
}  // namespace aidl
