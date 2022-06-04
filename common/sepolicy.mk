#
# This policy configuration will be used by all products that
# inherit from PixelExperience
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    device/aniosp/sepolicy/common/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/aniosp/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/aniosp/sepolicy/common/dynamic \
    device/aniosp/sepolicy/common/system

ifneq ($(TARGET_HAL_POWER_RW_INPUT_DEVICE), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/aniosp/sepolicy/common/dynamic_extra
endif
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/aniosp/sepolicy/common/dynamic \
    device/aniosp/sepolicy/common/dynamic_extra \
    device/aniosp/sepolicy/common/vendor
endif

# Selectively include legacy rules defined by the products
-include device/aniosp/sepolicy/legacy-common/sepolicy.mk
