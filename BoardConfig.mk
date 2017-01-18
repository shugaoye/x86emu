#
# Copyright (C) 2016 The Android Open Source Project
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

include $(SRC_TARGET_DIR)/board/generic_x86/BoardConfig.mk

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 576716800
BOARD_CACHEIMAGE_PARTITION_SIZE := 69206016
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

#
# Additional hardware support
# Wifi
BOARD_WPA_SUPPLICANT_DRIVER := WIRED
WPA_SUPPLICANT_VERSION      := VER_0_8_X VER_2_1_DEVEL
BOARD_WLAN_DEVICE           := eth1

