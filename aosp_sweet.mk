# Inherit common products
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit device configurations
$(call inherit-product, device/xiaomi/sweet/device.mk)

# Inherit some common Pixel Experience stuff.
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_INCLUDE_STOCK_ARCORE := true
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_SUPPORTS_CALL_RECORDING := true

# Additional Pixel stuffs
TARGET_INCLUDE_CARRIER_SETTINGS := true
TARGET_SHIP_PREBUILT_APEX := true

PRODUCT_NAME := aosp_sweet
PRODUCT_DEVICE := sweet
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi Note 10 Pro
PRODUCT_MANUFACTURER := Xiaomi

TARGET_FACE_UNLOCK_SUPPORTED := true

PRODUCT_GMS_CLIENTID_BASE := android-google

TARGET_BOOT_ANIMATION_RES := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="redfin-user 12 SQ3A.220605.009.A1 8643238 release-keys" \
    PRODUCT_BRAND=google \
    TARGET_DEVICE=redfin \
    PRODUCT_MANUFACTURE=Google \
    PRODUCT_MODEL="Pixel 5" \
    TARGET_PRODUCT=redfin \
    PRODUCT_SYSTEM_BRAND=google \
    PRODUCT_SYSTEM_DEVICE=redfin \
    PRODUCT_SYSTEM_MANUFACTURER=Google \
    PRODUCT_SYSTEM_MODEL="Pixel 5" \
    PRODUCT_SYSTEM_NAME=redfin

BUILD_FINGERPRINT := google/redfin/redfin:12/SQ3A.220605.009.A1/8643238:user/release-keys

