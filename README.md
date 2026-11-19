# Android device tree for Redmi 13 (moon, model 24040RN64Y, MT6768)

```
#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
```

## Status (HyperOS OS3.0.301.0.WNTMIXM / vendor+kernel Android 15 SDK35 / boot GKI 6.6.89 / vendor_boot v4)
Terverifikasi dari image stock: header v4, base 0x40078000, ramdisk 0x07c08000, tags/dtb 0x0bc08000,
cmdline `bootopt=64S3,32N2,64N2`, DTB MT6768, boot 64MB, vendor_boot 64MB, recovery = fragment di vendor_boot.
Belum pasti (lihat TODO di BoardConfig.mk): HAL beanpod untuk decrypt, variabel recovery-in-vendor_boot per branch.
Diukur di perangkat: boot, vendor_boot, dtbo, vbmeta* semuanya slotted (_a/_b); super 7247757312; tidak ada partisi init_boot (hanya nama fragment di dalam vendor_boot).

## Build PBRP lewat GitHub Actions
1. Salin ke `prebuilt/`: `kernel` (dari kernel.bin) dan `dtb.img` (dari dtb_raw.bin). Commit.
2. Push repo ini ke GitHub (repo tree = isi folder ini, bukan folder induknya).
3. Tab Actions -> "Build PBRP (Redmi 13 / moon)" -> Run workflow.
Catatan: default manifest branch android-14.0 (base AOSP android-14.0.0_r17, vendor/pb pb-14.0). Vendor perangkat Android 15; decrypt /data (keymaster 4.1 beanpod + gatekeeper beanpod) butuh blob vendor, lihat elfdeps.py.
# PBRP-Recovery---Unoffcial
