# Sepolicy
rm -Rf device/qcom/sepolicy && git clone git@github.com:ArrowOS/android_device_qcom_sepolicy.git --depth 1 device/qcom/sepolicy
rm -Rf device/qcom/sepolicy_vndr && git clone git@github.com:ArrowOS/android_device_qcom_sepolicy_vndr.git --depth 1 device/qcom/sepolicy_vndr
git apply --directory='device/qcom/sepolicy_vndr' device/xiaomi/sweet/.patch/device_qcom_sepolicy_vndr-adapt-to-PE.patch

# PixelPropsUtils Dialer whitelisting
cd frameworks/base && git reset --hard && cd ../../
git apply --directory='frameworks/base' device/xiaomi/sweet/.patch/frameworks_base-PixelPropsUtils.patch
