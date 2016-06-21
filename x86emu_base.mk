#
# Copyright (C) 2014 The Android Open Source Project
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

# This file contains the definitions needed for a _really_ minimal system
# image to be run under emulation under upstream QEMU (www.qemu.org), once
# it supports a few Android virtual devices. Note that this is _not_ the
# same as running under the Android emulator.

# This should only contain what's necessary to boot the system, support
# ADB, and allow running command-line executable compiled against the
# following NDK libraries: libc, libm, libstdc++, libdl, liblog

##############################################################
# Source: device/intel/mixins/groups/houdini/true/product.mk
##############################################################
# $(call inherit-product-if-exists, vendor/intel/houdini/houdini.mk)

# ifeq ($(FLAG_GMS_AVAILABLE),yes)
# ifneq ($(FLAG_GMS_PACKAGES), minimal)
# GMS_PATH := vendor/google/gms
# PRODUCT_COPY_FILES += \
#     $(GMS_PATH)/apps/AndroidPay/lib/armeabi/libbarhopper.so:system/app/AndroidPay/lib/arm/libbarhopper.so \
#     $(GMS_PATH)/apps/AndroidPay/lib/armeabi/libframesequence.so:system/app/AndroidPay/lib/arm/libframesequence.so \
#     $(GMS_PATH)/apps/AndroidPay/lib/armeabi/libgoogle-ocrclient.so:system/app/AndroidPay/lib/arm/libgoogle-ocrclient.so

# PRODUCT_PACKAGES += \
#     AndroidPay \
#     TagGoogle
# endif
# else
# PRODUCT_PACKAGES += \
#     Tag
# endif

##############################################################
# Source: device/intel/mixins/groups/gms/minimal/product.mk.1
##############################################################
# FLAG_GMS_PACKAGES := minimal
##############################################################
# Source: device/intel/mixins/groups/gms/minimal/product.mk
##############################################################
#FLAG_GMS_AVAILABLE := yes
#$(call inherit-product-if-exists, vendor/google/gms/products/gms.mk)

# Host modules
# PRODUCT_PACKAGES += \
#    adb \


# PRODUCT_COPY_FILES += \
#    device/generic/goldfish/ueventd.ranchu.rc:root/ueventd.ranchu.rc \


##############################################################
# Fix ranchu build issue
##############################################################
PRODUCT_PACKAGES += \
    gralloc.ranchu \
    camera.ranchu \
    camera.ranchu.jpeg \
    lights.ranchu \
    gps.ranchu \
    fingerprint.ranchu \
    audio.primary.ranchu \
    vibrator.ranchu \
    sensors.ranchu
#    fingerprintd \

##############################################################
# Kernel build
##############################################################
TARGET_KERNEL_SOURCE := kernel
TARGET_KERNEL_CONFIG := i386_ranchu_defconfig
TARGET_ARCH := x86

PRODUCT_OUT ?= out/target/product/x86

include $(TARGET_KERNEL_SOURCE)/AndroidKernel.mk

# define build targets for kernel
.PHONY: $(TARGET_PREBUILT_KERNEL)

LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)

PRODUCT_COPY_FILES += \
     $(LOCAL_KERNEL):kernel \

