# PixelPropsUtils Dialer whitelisting
cd frameworks/base && git reset --hard && cd ../../
git apply --directory='frameworks/base' device/xiaomi/sweet/.patch/frameworks_base-PixelPropsUtils.patch

# Custom hardware_qcom-caf_sm8150-common_display repo
rm -Rf hardware/qcom-caf/sm8150-common/display && git clone git@github.com:someone5678/hardware_qcom-caf_sm8150-common_display.git --depth 1 hardware/qcom-caf/sm8150-common/display
