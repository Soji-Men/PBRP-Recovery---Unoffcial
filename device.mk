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

# Boot control HAL: vendor memakai AIDL android.hardware.boot-service.mtk.
# Biner & library-nya disalin dari stock lewat proprietary/ (lihat elfdeps.py), bukan dibangun dari source.
# (PRODUCT_STATIC_BOOT_CONTROL_HAL sudah dihapus di AOSP baru.)

# stub libhardware_legacy untuk recovery (tanpa service suspend)
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)
PRODUCT_PACKAGES += libhardware_legacy_moonstub.recovery

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
