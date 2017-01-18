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
#
#******************************************************************************
#
# Makefile - Make file for eclipse integration
#
# Copyright (c) 2016 Roger Ye.  All rights reserved.
#
# This is part of the build for virtual device x86emu.
#
#******************************************************************************

MKBOOTFS := mkbootfs

all:
	cd ../../..;make -j8 showcommands 2>&1 | tee x86emu-`date +%Y%m%d`.txt

x86emu:
	cd ../../..;make -j4

snod:
	cd ../../..;make snod

qcow2_img:
	mkdir -p ${OUT}/system/x86emu_ch07
	cp ${OUT}/ramdisk.img ${OUT}/system/x86emu_ch07
	cd ../../..;make qcow2_img USE_SQUASHFS=0

installer:
	cd ../../..;$(MKBOOTFS) ${OUT}/installer | gzip -9 > ${OUT}/initrd.img

ramdisk:
	cd ../../..;$(MKBOOTFS) -d ${OUT}/system ${OUT}/root | minigzip > ${OUT}/ramdisk.img

kernel-config:
	cd ../../..;make -j2 -C kernel O=../out/target/product/x86emu/obj/KERNEL_OBJ ARCH=x86 i386_ranchu_defconfig

kernel:
	cd ../../..;make -j2 -C kernel O=../out/target/product/x86emu/obj/KERNEL_OBJ ARCH=x86

clean-ramdisk:
	rm ${OUT}/ramdisk.img
	rm -rf ${OUT}/root

clean-initrd:
	rm ${OUT}/initrd.img
	rm -rf ${OUT}/installer

clean-kernel:
	cd ../../..;make -j2 -C kernel O=../out/target/product/x86emu/obj/KERNEL_OBJ ARCH=x86 clean

