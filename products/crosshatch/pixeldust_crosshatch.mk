# Copyright (C) 2019 The PixelDust Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Bootanimation
BOOTANIMATION := 1440

# Release name
PRODUCT_RELEASE_NAME := Pixel 3 XL
export TARGET_DEVICE=crosshatch

# We have our own power HAL
TARGET_USES_DEVICE_SPECIFIC_POWERHAL := true

# Use the AOSP stack
TARGET_USES_AOSP := true

# Use the sepolicies which are being shipped with our device
TARGET_EXCLUDE_QCOM_VENDOR_SEPOLICY := true

# Indicate that we use AOSP surfaceflinger
TARGET_USE_AOSP_SURFACEFLINGER := true

# Inherit from those products. Most specific first.
$(call inherit-product, device/google/crosshatch/aosp_crosshatch.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

# Face Unlock
$(call inherit-product-if-exists, external/motorola/faceunlock/faceunlock.mk)

# Google Apps
$(call inherit-product-if-exists, vendor/gapps/gapps.mk)
REMOVE_GAPPS_PACKAGES += \
    PrebuiltGmail \
    NexusLauncherRelease

PRODUCT_NAME := pixeldust_crosshatch
PRODUCT_DEVICE := crosshatch
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 3 XL

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="crosshatch" \
    PRIVATE_BUILD_DESC="crosshatch-user 10 QQ3A.200805.001 6578210 release-keys"

BUILD_FINGERPRINT := "google/crosshatch/crosshatch:10/QQ3A.200805.001/6578210:user/release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=google/crosshatch/crosshatch:10/QQ3A.200805.001/6578210:user/release-keys \
    ro.pixeldust.maintainer="slothdabski" \
    ro.pixeldust.device="crosshatch"

# Vendor
$(call inherit-product-if-exists, vendor/google/crosshatch/crosshatch-vendor.mk)
