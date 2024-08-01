# Inherit dolby configuration
$(call inherit-product, vendor/nokia/dolby/dolby-vendor.mk)

CONFIG_PATH := vendor/nokia/dolby

# Audio props
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true
TARGET_EXCLUDES_AUDIOFX := true

# HIDL
DEVICE_MANIFEST_FILE := $(CONFIG_PATH)/hidl/manifest.xml

# Shared libs 
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v31/arm/arch-arm-armv7-a-neon/shared/vndk-core/libstagefright_foundation.so:$(TARGET_COPY_OUT_VENDOR)/lib/libstagefright_foundation-v33.so \
    prebuilts/vndk/v31/arm64/arch-arm64-armv8-a/shared/vndk-core/libstagefright_foundation.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libstagefright_foundation-v33.so

# Props
PRODUCT_PRODUCT_PROPERTIES += \
	persist.vendor.audio_fx.current=dolby \
	ro.vendor.audio.dolby.dax.support=true \
	ro.vendor.dolby.dax.version=DAX3_3.6.0.12_r1

# Props Override
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.audio.dolby.ds2.enabled=true \
	vendor.audio.dolby.ds2.hardbypass=true

# SEPolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(CONFIG_PATH)/sepolicy/vendor
