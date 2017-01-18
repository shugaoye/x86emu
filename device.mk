#
# Copyright 2016 The Android Open-Source Project
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


# Wi-Fi support
PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=eth1

PRODUCT_PACKAGES += \
    dhcpcd \
    dhcpcd-run-hooks \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wlutil \
    wpa_supplicant \
    wpa_supplicant.conf

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml

# For android_filesystem_config.h
PRODUCT_PACKAGES += \
   fs_config_files

PRODUCT_COPY_FILES += \
    device/generic/x86emu/wpa_supplicant.conf:data/misc/wifi/wpa_supplicant.conf \

$(call inherit-product, $(SRC_TARGET_DIR)/board/generic_x86/device.mk)
