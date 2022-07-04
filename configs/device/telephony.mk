#
# Copyright (C) 2022 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, vendor/qcom/opensource/dataservices/dataservices_vendor_product.mk)
$(call inherit-product, vendor/qcom/opensource/data-ipa-cfg-mgr/ipacm_vendor_product.mk)

PRODUCT_PACKAGES += \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti \
    libvndfwk_detect_jni.qti.vendor

PRODUCT_COPY_FILES += \
    device/xiaomi/sweet/configs/permissions/system_ext-privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-qti.xml

PRODUCT_COPY_FILES += \
    device/xiaomi/sweet/configs/telephony/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml \
    device/xiaomi/sweet/configs/telephony/sensitive_pn.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sensitive_pn.xml

PRODUCT_PACKAGES += \
    CellBroadcastReceiver

PRODUCT_PACKAGES += \
    libjson \
    libjson.vendor \
    libril \
    librilutils \
    librmnetctl

PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti-telephony-hidl-wrapper-prd \
    qti_telephony_hidl_wrapper.xml \
    qti_telephony_hidl_wrapper_prd.xml \
    qti-telephony-utils \
    qti-telephony-utils-prd \
    qti_telephony_utils.xml \
    qti_telephony_utils_prd.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml

PRODUCT_SYSTEM_PROPERTIES += \
    DEVICE_PROVISIONED=1 \
    persist.vendor.cne.feature=1 \
    persist.vendor.dpm.feature=11 \
    ril.subscription.types=NV,RUIM \
    ro.telephony.default_cdma_sub=0 \
    ro.telephony.default_network=22,20 \
    ro.vendor.use_data_netmgrd=true \
    telephony.lteOnCdmaDevice=1

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.radio.add_power_save=1 \
    persist.vendor.radio.atfwd.start=true \
    persist.vendor.radio.data_con_rprt=1 \
    persist.vendor.radio.dynamic_sar=1 \
    persist.vendor.radio.force_ltd_sys_ind=1 \
    persist.vendor.radio.force_on_dc=true \
    persist.vendor.radio.manual_nw_rej_ct=1 \
    persist.vendor.radio.mt_sms_ack=30 \
    persist.vendor.radio.process_sups_ind=1 \
    persist.vendor.radio.report_codec=1 \
    persist.vendor.radio.ucdetect.usb=true

# Radio
PRODUCT_VENDOR_PROPERTIES += \
    persist.radio.calls.on.ims=1
    persist.radio.data_ltd_sys_ind=1 \
    persist.radio.NO_STAPA=1 \
    persist.radio.VT_CAM_INTERFACE=2 \
    persist.radio.VT_ENABLE=1 \
    persist.radio.VT_HYBRID_ENABLE=1 \

# RIL Powersaving
PRODUCT_VENDOR_PROPERTIES += \
    persist.radio.add_power_save=1 \
    pm.sleep_mode=1 \
    ro.ril.disable.power.collapse=0 \
    ro.ril.fast.dormancy.rule=1 \
    ro.ril.fast.dormancy.timeout=3 \
    ro.mot.eri.losalert.delay=1000

# IMS
PRODUCT_VENDOR_PROPERTIES += \
    persist.dbg.ims_volte_enable=1 \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1 \
    persist.vendor.qti.telephony.vt_cam_interface=2

# RCS
PRODUCT_VENDOR_PROPERTIES += \
    persist.rcs.supported=1

ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.vendor.ims.disableADBLogs=1 \
    persist.vendor.ims.disableDebugLogs=1 \
    persist.vendor.ims.disableIMSLogs=1 \
    persist.vendor.ims.disableQXDMLogs=1 \
    persist.vendor.ims.loglevel=0 \
    persist.vendor.ims.rtp.enableqxdm=0 \
    persist.vendor.ims.vt.enableadb=0
endif

PRODUCT_PACKAGES += \
    CarrierConfigOverlaySweet \
    TelephonyOverlaySweet \
    WifiOverlaySweet \
    WifiOverlaySweetinpro
