#
# Copyright 2014 The Android Open-Source Project
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
#

$(call inherit-product, device/generic/x86emu/device.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

# Overrides
PRODUCT_BRAND := x86emu_x86
PRODUCT_NAME := x86emu_x86
PRODUCT_DEVICE = x86emu
PRODUCT_MODEL := x86emu_android-7.1.1_r4_ch06

TARGET_ARCH := x86
TARGET_KERNEL_CONFIG := i386_ranchu_defconfig

$(call inherit-product, $(LOCAL_PATH)/x86emu_base.mk)

