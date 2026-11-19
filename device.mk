#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/xiaomi/moon
# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

PRODUCT_PACKAGES += \
    bootctrl.mt6768

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.mt6768 \
    libgptutils \
    libz \
    libcutils

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# --- Decrypt FBE: blob beanpod (keymaster 4.1 HIDL + gatekeeper AIDL) dari /vendor stock ---
# Isi folder proprietary/ memakai struktur path asli, contoh:
#   proprietary/vendor/bin/hw/android.hardware.keymaster@4.1-service.beanpod
#   proprietary/vendor/bin/hw/android.hardware.gatekeeper-service.beanpod
#   proprietary/vendor/lib64/*.so   (hasil elfdeps.py --copy; JANGAN sertakan vendor/etc/init/*.rc)
# Disalin ke ramdisk recovery pada path yang sama. TODO: belum diuji di perangkat.
ifneq ($(wildcard $(LOCAL_PATH)/proprietary),)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/proprietary,$(TARGET_COPY_OUT_RECOVERY)/root)
endif
