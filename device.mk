# Shipping level
PRODUCT_SHIPPING_API_LEVEL := 30

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 30

# Platform
MSMSTEPPE := sm6150
TARGET_BOARD_PLATFORM := $(MSMSTEPPE)

# Dynamic partitions setup
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Device configs makefiles
$(call inherit-product, device/xiaomi/sweet/configs/device/telephony.mk)
$(call inherit-product, device/xiaomi/sweet/configs/device/refreshrate.mk)

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files

# Firmware
$(call inherit-product-if-exists, vendor/xiaomi-firmware/sweet/Android.mk)

# AudioFX
TARGET_EXCLUDES_AUDIOFX := true

# Audio
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

PRODUCT_PACKAGES += \
    audio_effects.conf \
    a2dp_audio_policy_configuration.xml \
    audio_effects.xml \
    audio_io_policy.conf \
    audio_platform_info.xml \
    audio_platform_info_intcodec.xml \
    audio_policy_configuration.xml \
    audio_policy_volumes.xml \
    audio_tuning_mixer.txt \
    bluetooth_qti_audio_policy_configuration.xml \
    mixer_paths_idp.xml \
    mixer_paths_overlay_dynamic.xml \
    mixer_paths_overlay_static.xml \
    mixer_paths_wcd9375qrd.xml \
    r_submix_audio_policy_configuration.xml \
    sound_trigger_mixer_paths.xml \
    sound_trigger_mixer_paths_qrd.xml \
    sound_trigger_mixer_paths_wcd9340.xml \
    sound_trigger_platform_info.xml \
    usb_audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
    hardware/qcom-caf/sm8150/audio/configs/msmsteppe/graphite_ipc_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/graphite_ipc_platform_info.xml \
    hardware/qcom-caf/sm8150/audio/configs/msmsteppe/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/listen_platform_info.xml

PRODUCT_PACKAGES += \
    libvolumelistener \
    libaudiopreprocessing \
    libaudio-resampler \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcompostprocbundle \
    audio.a2dp.default \
    audio.bluetooth.default \
    audio.r_submix.default \
    audio.usb.default \
    android.hardware.audio.service \
    android.hardware.audio.common-util \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio@7.0-impl \
    libtinycompress \
    libtinycompress.vendor \
    android.hardware.bluetooth.a2dp@1.0-impl.mock

PRODUCT_PACKAGES += \
    android.hardware.soundtrigger@2.3-impl \
    android.hardware.soundtrigger@2.3-service

PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc

# Adaptive charging
PRODUCT_PACKAGES += \
    adaptivecharging.xml

# Authsecret
PRODUCT_PACKAGES += \
    android.hardware.authsecret@1.0.vendor

# Charger
PRODUCT_PACKAGES += \
    libsuspend

# Enforce native interfaces of product partition as VNDK
PRODUCT_PRODUCT_VNDK_VERSION := current

# Enforce java interfaces of product partition
PRODUCT_ENFORCE_PRODUCT_PARTITION_INTERFACE := true

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# File systems table
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.default

PRODUCT_PACKAGES += \
    fstab.qcom \
    fstab.zram

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.allocator@1.0 \
    libhwbinder \
    libhwbinder.vendor \
    libhidlbase \
    libhidlbase.vendor

# LibNativeHelper
PRODUCT_HOST_PACKAGES += \
	libnativehelper

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock

# Freeform Multiwindow
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml

# Iorap
PRODUCT_PACKAGES += \
    iorap-app-startup-runner

# IPACM
PRODUCT_PACKAGES += \
    IPACM_cfg.xml \
    ipacm \
    ipacm.rc

# Init
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.sm6150.perf.rc \
    init.performance_level.rc \
    init.sweet.rc \
    init.target.rc

PRODUCT_PACKAGES += \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.sh

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qcom.usb.rc \
    $(LOCAL_PATH)/rootdir/bin/init.qcom.usb.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qcom.usb.sh \
    $(LOCAL_PATH)/rootdir/etc/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc

# Keyhandler
PRODUCT_PACKAGES += \
    KeyHandler

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayout/sm6150-idp-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sm6150-idp-snd-card_Button_Jack.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.sweet

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    SecureElement \
    com.android.nfc_extras \
    android.hardware.nfc@1.2.vendor \
    android.hardware.nfc@1.2-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml

PRODUCT_PACKAGES += \
    libnfc-nci.conf \
    libnfc-nxp.conf

# Device Settings
PRODUCT_PACKAGES += \
    DeviceSettings \
    init.devicesettings.rc \
    privapp-permissions-devicesettings.xml

# Overlays
PRODUCT_PACKAGES += \
    BluetoothOverlaySweet \
    DialerOverlaySweet \
    DocumentsUIOverlaySweet \
    FrameworkResOverlaySweet \
    NotchBarKiller \
    SettingsOverlaySweet \
    SettingsLibOverlaySweet \
    SettingsProviderOverlaySweet \
    SimpleDeviceConfigOverlaySweet \
    SettingsProviderSweetinpro \
    SystemUIOverlaySweet \
    TetheringConfigOverlaySweet \
    ApplockOverlay \
    CustomWebViewOverlay

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2021-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2021-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# QTI Whitelist
PRODUCT_PACKAGES += \
    qti_whitelist.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/qcom-caf/wlan \
    vendor/qcom/opensource/data-ipa-cfg-mgr \
    vendor/xiaomi-firmware \
    hardware/google/interfaces \
    hardware/google/pixel

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong \
    com.dsi.ant@1.0.vendor

# Atrace
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service

# Perf
PRODUCT_PACKAGES += \
    libqti-perfd-client

PRODUCT_PACKAGES += \
    msm_irqbalance.conf

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.xiaomi-libperfmgr \
    android.hardware.power@1.2.vendor \
    android.hardware.power.stats@1.0-service.mock

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/power/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

# WiFi Display
PRODUCT_PACKAGES += \
    libavservices_minijail \
    libavservices_minijail.vendor \
    libdisplayconfig.qti \
    libminijail \
    libnl \
    libqdMetaData \
    libwfdaac_vendor \
    vendor.display.config@2.0

# Camera
PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0.vendor \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    android.hardware.camera.provider@2.4-external \
    libmm-qcamera \
    libdng_sdk.vendor \
    libgui_vendor \
    libxml2 \
    CameraGo \
    privapp-permissions-camera-go.xml \
    vendor.qti.hardware.camera.device@1.0.vendor

PRODUCT_PACKAGES += \
    libshim_megvii

# Codec2 modules
PRODUCT_PACKAGES += \
    com.android.media.swcodec \
    libsfplugin_ccodec

# Display
PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0.vendor \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    vendor.qti.hardware.display.allocator-service \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    gralloc.default \
    gralloc.sm6150 \
    hwcomposer.sm6150 \
    memtrack.sm6150 \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapperextensions@1.1.vendor

PRODUCT_PACKAGES += \
    libsdmcore-shim

PRODUCT_PACKAGES += \
    disable_configstore

PRODUCT_PACKAGES += \
    dsi_k6_38_0c_0a_fhd_dsc_video_display_mi.xml \
    qdcm_calib_data_xiaomi_k6_38_0c_0a_fhd_dsc_video_dsi_panel.xml \
    hdr_config.cfg \
    sdr_config.cfg

# Media
PRODUCT_PACKAGES += \
    libarbitrarybytes \
    libplatformconfig \
    libmm-omxcore \
    libOmxCore \
    libc2dcolorconvert \
    libOmxSwVdec \
    libOmxSwVencMpeg4 \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw \
    libcodec2_vndk.vendor \
    libcodec2_hidl@1.0.vendor \
    libavservices_minijail_vendor

PRODUCT_PACKAGES += \
    libcodec2_vndk.vendor \
    libcodec2_hidl@1.0.vendor

PRODUCT_PACKAGES += \
    android.hardware.media.c2@1.0.vendor \
    android.hardware.media.omx@1.0-service

# Enable Codec 2.0
PRODUCT_PACKAGES += \
    libqcodec2_base \
    libqcodec2_utils \
    libqcodec2_platform \
    libqcodec2_core \
    libqcodec2_basecodec \
    libqcodec2_v4l2codec \
    vendor.qti.media.c2@1.0-service \
    codec2.vendor.ext-arm64.policy \
    codec2.vendor.base-arm64.policy

# Media codecs C2
PRODUCT_PACKAGES += \
    codec2play \
    libcodec2_soft_aacdec \
    libcodec2_soft_aacenc \
    libcodec2_soft_amrnbdec \
    libcodec2_soft_amrwbdec \
    libcodec2_soft_amrnbenc \
    libcodec2_soft_amrwbenc \
    libcodec2_soft_av1dec_aom \
    libcodec2_soft_avcdec \
    libcodec2_soft_avcenc \
    libcodec2_soft_common \
    libcodec2_soft_flacdec \
    libcodec2_soft_flacenc \
    libcodec2_soft_g711alawdec \
    libcodec2_soft_g711mlawdec \
    libcodec2_soft_av1dec_gav1 \
    libcodec2_soft_gsmdec \
    libcodec2_soft_hevcdec \
    libcodec2_soft_hevcenc \
    libcodec2_soft_mp3dec \
    libcodec2_soft_mpeg2dec \
    libcodec2_soft_mpeg4dec \
    libcodec2_soft_h263dec \
    libcodec2_soft_mpeg4enc \
    libcodec2_soft_h263enc \
    libcodec2_soft_opusdec \
    libcodec2_soft_opusenc \
    libcodec2_soft_rawdec \
    libcodec2_soft_vorbisdec \
    libcodec2_soft_vp9dec \
    libcodec2_soft_vp8dec \
    libcodec2_soft_vp9enc \
    libcodec2_soft_vp8enc \
    libcodec2_soft_xaacdec

PRODUCT_PACKAGES += \
    media_codecs.xml \
    media_codecs_c2.xml \
    media_codecs_omx.xml \
    media_codecs_performance_c2.xml \
    media_profiles_V1_0.xml

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/seccomp/,$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_ODM)/etc/media_profiles_V1_0.xml

PRODUCT_COPY_FILES += \
    prebuilts/vndk/v30/arm64/arch-arm-armv8-a/shared/vndk-core/libstagefright_omx.so:$(TARGET_COPY_OUT_VENDOR)/lib/vndk/libstagefright_omx.so \
    prebuilts/vndk/v30/arm64/arch-arm-armv8-a/shared/vndk-core/libstagefright_omx_utils.so:$(TARGET_COPY_OUT_VENDOR)/lib/vndk/libstagefright_omx_utils.so \
    prebuilts/vndk/v30/arm64/arch-arm64-armv8-a/shared/vndk-core/libstagefright_omx.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vndk/libstagefright_omx.so \
    prebuilts/vndk/v30/arm64/arch-arm64-armv8-a/shared/vndk-core/libstagefright_omx_utils.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vndk/libstagefright_omx_utils.so

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

PRODUCT_COPY_FILES += \
    hardware/qcom-caf/sm8150-common/media/conf_files/sm6150/system_properties.xml:$(TARGET_COPY_OUT_VENDOR)/etc/system_properties.xml

# Transcoding related property.
PRODUCT_PROPERTY_OVERRIDES += \
    debug.media.transcoding.codec_max_operating_rate_720P=480 \
    debug.media.transcoding.codec_max_operating_rate_1080P=240 \
    debug.media.transcoding.codec_max_operating_rate_4k=120

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4-service.clearkey \
    android.hardware.drm@1.3.vendor

# Doze
PRODUCT_PACKAGES += \
    Doze

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    libwifi-hal-qcom \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PACKAGES += \
    vendor.qti.hardware.wifi.hostapd@1.2.vendor \
    vendor.qti.hardware.wifi.supplicant@2.2.vendor

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@2.0-service.qti

# Infrared
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-service \
    android.hardware.ir@1.0-impl

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-service \
    android.hardware.sensors@1.0-impl \
    libsensorndkbridge

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/usb/etc

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl:64 \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service \
    android.hardware.health@2.0-impl-2.1

# ContextHub
PRODUCT_PACKAGES += \
    android.hardware.contexthub@1.0-service \
    android.hardware.contexthub@1.0-impl

# CAS
PRODUCT_PACKAGES += \
    android.hardware.cas@1.2-service

# ServiceTracker
PRODUCT_PACKAGES += \
    vendor.qti.hardware.servicetracker@1.2.vendor

# System Helper
PRODUCT_PACKAGES += \
    vendor.qti.hardware.systemhelper@1.0.vendor

# Vendor service manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Vulkan
PRODUCT_PACKAGES += \
    libvulkan

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1 \
    android.hardware.gnss.measurement_corrections@1.1 \
    android.hardware.gnss.measurement_corrections@1.1.vendor \
    android.hardware.gnss.visibility_control@1.0 \
    android.hardware.gnss.visibility_control@1.0.vendor

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1.vendor \
    android.hardware.gnss@2.1-impl-qti \
    android.hardware.gnss@2.1-service-qti

PRODUCT_PACKAGES += \
    libbatching \
    libgeofencing \
    liblocation_api \
    liblocation_api_headers \
    libloc_core \
    libloc_pla_headers \
    libgps.utils \
    libgps.utils_headers \
    libgnss

PRODUCT_PACKAGES += \
    apdr.conf \
    flp.conf \
    gnss_antenna_info.conf \
    gps.conf \
    izat.conf \
    lowi.conf \
    sap.conf

PRODUCT_PACKAGES += \
    gnss@2.0-base.policy \
    gnss@2.0-xtra-daemon.policy

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.sweet

# Vibrator
PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.impl \
    vendor.qti.hardware.vibrator.service \
    android.hardware.vibrator-V1-ndk_platform.vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vibrator/excluded-input-devices.xml:$(TARGET_COPY_OUT_VENDOR)/etc/excluded-input-devices.xml

# VINTF
PRODUCT_PACKAGES += \
    manifest_nfc \
    manifest_empty \
    android.hardware.neuralnetworks@1.3-service-qti-hta \
    android.hardware.neuralnetworks@1.3-service-qti \
    android.hardware.wifi.hostapd \
    manifest_android.hardware.drm@1.3-service.widevine \
    vendor.qti.gnss@4.0-service \
    vendor.qti.hardware.servicetracker@1.2-service

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1.vendor

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.1.vendor \
    android.hardware.bluetooth.audio@2.1-impl \
    com.qualcomm.qti.bluetooth_audio@1.0.vendor \
    libbtconfigstore \
    libbthost_if \
    vendor.qti.hardware.bluetooth_audio@2.1.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor

# NeuralNetworks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# Shims
PRODUCT_PACKAGES += \
    libgui-shim

# Disable touch video heatmap to reduce latency, motion jitter, and CPU usage
# on supported devices with Deep Press input classifier HALs and models
PRODUCT_PRODUCT_PROPERTIES += \
	ro.input.video_enabled=false

# Wlan
PRODUCT_CFI_INCLUDE_PATHS += \
    hardware/qcom-caf/wlan/qcwcn/wpa_supplicant_8_lib

# Speed profile services and wifi-service to reduce RAM and storage
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true
USE_DEX2OAT_DEBUG := false
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
WITH_DEXPREOPT_DEBUG_INFO := false

PRODUCT_DEXPREOPT_SPEED_APPS += \
    Settings

# QTI Bluetooth
-include vendor/qcom/opensource/commonsys-intf/bluetooth/bt-commonsys-intf-board.mk
$(call inherit-product, vendor/qcom/opensource/commonsys-intf/bluetooth/bt-system-opensource-product.mk)

$(call inherit-product, vendor/xiaomi/sweet/sweet-vendor.mk)
$(call inherit-product-if-exists, vendor/dolby/config.mk)
$(call inherit-product-if-exists, vendor/pixel-additional/config.mk)
include build/make/target/product/iorap_large_memory_config.mk

# QC common
TARGET_COMMON_QTI_COMPONENTS := \
    adreno \
    av \
    bt \
    display \
    gps \
    vibrator \
    wlan

$(call inherit-product, device/qcom/common/common.mk)
