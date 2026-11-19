#
# Copyright (C) 2026 The Android Open Source Project
# SPDX-License-Identifier: Apache-2.0
#
# PBRP product makefile for Redmi 13 (moon, MT6768)

# Define hardware platform
PRODUCT_PLATFORM := mt6768

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/pb/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/xiaomi/moon/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := moon
PRODUCT_NAME := pb_moon
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi 13
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vnd_moon-user 15 AP3A.240905.015.A2 OS3.0.301.0.WNTMIXM release-keys"

BUILD_FINGERPRINT := Redmi/vnd_moon/moon:15/AP3A.240905.015.A2/OS3.0.301.0.WNTMIXM:user/release-keys
