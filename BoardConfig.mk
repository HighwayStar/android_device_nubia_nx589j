#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from common msm8976-common
-include device/nubia/msm8976-common/BoardConfigCommon.mk

DEVICE_PATH := device/nubia/nx589j

# Asserts
TARGET_OTA_ASSERT_DEVICE := nx589j,NX589J

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# CMHW
BOARD_HARDWARE_CLASS += \
    $(DEVICE_PATH)/cmhw

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
TARGET_KERNEL_CONFIG := lineageos_nx589j_defconfig

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 6442450944
BOARD_USERDATAIMAGE_PARTITION_SIZE := 54817938432 # 54817954816 - 16384
# Power
TARGET_TAP_TO_WAKE_NODE := "/sys/devices/soc/78b8000.i2c/i2c-4/4-0020/wakeup_gesture"

# Sepolicy
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# TWRP
ifeq ($(WITH_TWRP),true)
include $(DEVICE_PATH)/twrp.mk
endif

# inherit from the proprietary version
-include vendor/nubia/nx589j/BoardConfigVendor.mk
