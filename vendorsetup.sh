# Sepolicy
rm -Rf device/qcom/sepolicy && git clone git@github.com:ArrowOS/android_device_qcom_sepolicy.git --depth 1 device/qcom/sepolicy
rm -Rf device/qcom/sepolicy_vndr && git clone git@github.com:ArrowOS/android_device_qcom_sepolicy_vndr.git --depth 1 device/qcom/sepolicy_vndr
git apply --directory='device/qcom/sepolicy_vndr' device/xiaomi/sweet/.patch/device_qcom_sepolicy_vndr-adapt-to-PE.patch

# PixelPropsUtils Dialer whitelisting
cd frameworks/base && git reset --hard && cd ../../
git apply --directory='frameworks/base' device/xiaomi/sweet/.patch/frameworks_base-PixelPropsUtils.patch

# Revert "Don't enable ADB by default on userdebug builds"
cd build/make && git reset --hard && cd ../../
git apply --directory='build/make' device/xiaomi/sweet/.patch/build_make-post_process_props.patch

# Custom hardware_qcom-caf_sm8150-common_display repo
rm -Rf hardware/qcom-caf/sm8150-common/display && git clone git@github.com:someone5678/hardware_qcom-caf_sm8150-common_display.git --depth 1 hardware/qcom-caf/sm8150-common/display
