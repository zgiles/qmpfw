# targets.mk
# Copyright (C) 2011-2013 qmp.cat
#
# This is free software, licensed under the GNU General Public License v3. 
# See LICENSE for more information.
# 
#
# For each target the next variables must be defined
#  NAME := The name of the device used for output firmware file name
#  ARCH := The LEDE CPU architecture
#  SUBARCH := The LEDE CPU subarchitecture
#  IMAGE := The file path (relative to buildroot) to the firmware
#  PROFILE := The profile used for the device (must coincide with a configs/xxx filename=
#
# Optional
#  TARGET_MASTER := The device will use the same options defined in his target master
#  TBUILD := The buildroot directory (relative to BUILD_DIR)
#  SYSUPGRADE := The file path (relative to buildroot) to the firmware sysupgrade image
#
# Any option defined in Makefile can be overrided from here, for instance
#  override OWRT_SVN = svn://mysvn.com/owrt

HW_AVAILABLE := ar71xx alfa-nx bullet kvm nsm2 nsm5 nsm5-xw nslm5-xw rocket-m-xw pico2 rocket rs rspro mc-mac1200r tl-2543 tl-703n tl-wr841n-v7 tl-wr841n-v8 tl-wr841n-v9 tl-wr841n-v10 tl-842 tl-mr3020 tl-mr3040 tl-wdr3600 tl-wdr4300 tl-wdr4900-v1 wpe72 dragino2 alix soekris45xx x86 uap-pro unifi-ap vbox vmware vocore wt1520-4m wt1520-8m cf-wr800n dir-810l microwrt wrtnode wt3020-4m wt3020-8m miwifi-mini lamobo-r1 ar71xx-generic-ib ath25-generic-ib mpc85xx-generic-ib ramips-mt7620-ib ramips-rt305x-ib sunxi-generic-ib x86-generic-ib x86-geode-ib
TBUILD_LIST := lede

ifeq ($(T),ar71xx)
  NAME:=Generic_ar71xx
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-tiny-node
endif

ifeq ($(T),alfa-nx)
  NAME:=Alfa-Network_N5
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-alfa-nx-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-alfa-nx-squashfs-sysupgrade.bin
endif

ifeq ($(T),alix)
  NAME:=PC-Engines_Alix
  ARCH:=x86
  SUBARCH:=geode
  TBUILD:=lede
  PROFILE:=x86-qmp-big-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-x86-geode-combined-squashfs.img
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-x86-geode-combined-squashfs.img
endif

ifeq ($(T),x86)
  NAME:=Generic_x86
  ARCH:=x86
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=x86-qmp-big-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-x86-generic-combined-squashfs.img
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-x86-generic-combined-squashfs.img
endif

ifeq ($(T),soekris45xx)
  NAME:=Soekris_Net45xx
  ARCH:=x86
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=x86-qmp-big-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-x86-generic-combined-squashfs.img
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-x86-generic-combined-squashfs.img
endif

ifeq ($(T),bullet)
  NAME:=Ubiquiti_Bullet-M
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-bullet-m-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-bullet-m-squashfs-sysupgrade.bin
endif

ifeq ($(T),cf-wr800n)
  NAME:=Comfast_CF-WR800N
  ARCH:=ramips
  SUBARCH:=mt7620
  TBUILD:=lede
  PROFILE:=mt7620-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ramips-mt7620-cf-wr800n-squashfs-sysupgrade.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ramips-mt7620-cf-wr800n-squashfs-sysupgrade.bin
endif 

ifeq ($(T),nsm2)
  NAME:=Ubiquiti_NanoStation-M2
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-nano-m-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-nano-m-squashfs-sysupgrade.bin
endif

ifeq ($(T),nsm5)
  NAME:=Ubiquiti_NanoStation-M5
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-nano-m-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-nano-m-squashfs-sysupgrade.bin
endif

ifeq ($(T),nsm5-xw)
  NAME:=Ubiquiti_NanoStation-M5-XW
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-nano-m-xw-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-nano-m-xw-squashfs-sysupgrade.bin
endif

ifeq ($(T),nslm5-xw)
  NAME:=Ubiquiti_NanoStation-Loco-M5-XW
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-loco-m-xw-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-loco-m-xw-squashfs-sysupgrade.bin
endif

ifeq ($(T),lamobo-r1)
  NAME:=Lamobo_R1
  ARCH:=sunxi
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=sunxi-qmp-small-node
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-sunxi-Lamobo_R1-sdcard-vfat-ext4.img
endif

ifeq ($(T),rocket-m-xw)
  NAME:=Ubiquiti_Rocket-M5-XW
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-rocket-m-xw-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-rocket-m-xw-squashfs-sysupgrade.bin
endif

ifeq ($(T),pico2)
  NAME:=Ubiquiti_PicoStation-2
  ARCH:=ath25
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=at2-qmp-tiny-node
  BUILD_PATH:=$(BUILD_DIR)/ath25
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ath25-ubnt2-pico2-squashfs.bin
endif

ifeq ($(T),rocket)
  NAME:=Ubiquiti_Rocket-M
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-rocket-m-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-rocket-m-squashfs-sysupgrade.bin
endif

ifeq ($(T),rs)
  NAME:=Ubiquiti_RouterStation
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-big-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-rs-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-rs-squashfs-sysupgrade.bin
endif

ifeq ($(T),rspro)
  NAME:=Ubiquiti_RouterStation-Pro
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-big-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-rspro-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-rspro-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-2543)
  NAME:=TP-Link_TL-WR2543ND-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wr2543-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wr2543-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),mc-mac1200r)
  NAME:=Mercury_MAC1200R
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-mc-mac1200r-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-mc-mac1200r-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-wr841n-v7)
  NAME:=TP-Link_TL-WR841N-v7
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ar71xx_kstrip-qmp-tiny-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wr841nd-v7-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wr841nd-v7-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-wr841n-v8)
  NAME:=TP-Link_TL-WR841N-v8
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ar71xx_kstrip-qmp-tiny-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wr841n-v8-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wr841n-v8-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-wr841n-v9)
  NAME:=TP-Link_TL-WR841N-v9
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ar71xx_kstrip-qmp-tiny-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wr841n-v9-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wr841n-v9-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-wr841n-v10)
  NAME:=TP-Link_TL-WR841N-v10
  ARCH:=ar71xx
  TBUILD:=lede
  PROFILE:=ar71xx_kstrip-qmp-tiny-node
  IMAGE:=bin/targets/$(ARCH)/qmp-ar71xx-generic-tl-wr841n-v10-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/qmp-ar71xx-generic-tl-wr841n-v10-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-842)
  NAME:=TP-Link_TL-WR842ND-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-tiny-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wr842n-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wr842n-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-703n)
  NAME:=TP-Link_TL-WR703N-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-tiny-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wr703n-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wr703n-v1-squashfs-sysupgrade.bin
endif


ifeq ($(T),tl-mr3020)
  NAME:=TP-Link_TL-MR3020-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-tiny-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-mr3020-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-mr3020-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-mr3040)
  NAME:=TP-Link_TL-MR3040-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-tiny-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-mr3040-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-mr3040-v1-squashfs-sysupgrade.bin
endif 

ifeq ($(T),tl-wdr3600)
  NAME:=TP-Link_TL-WDR3600-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-big-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wdr3600-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wdr3600-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-wdr4300)
  NAME:=TP-Link_TL-WDR4300-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-big-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wdr4300-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wdr4300-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-wdr4900-v1)
  NAME:=TP-Link_TL-WDR4900-v1
  ARCH:=mpc85xx
  SUBARCH:=generic
  TBUILD:=lede
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-mpc85xx-generic-tl-wdr4900-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-mpc85xx-generic-tl-wdr4900-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-wr743nd)
  NAME:=TP-Link_TL-WR743ND-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-tiny-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wr743nd-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wr743nd-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-wr740n)
  NAME:=TP-Link_TL-WR740N-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-tiny-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wr740n-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-tl-wr740n-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),wpe72)
  NAME:=Compex_WPE72
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-wpe72-squashfs-8M-factory.img
endif

ifeq ($(T),dragino2)
  NAME:=Dragino_MS14
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-dragino2-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-dragino2-squashfs-sysupgrade.bin
endif

ifeq ($(T),unifi-ap)
  NAME:=Ubiquiti_UniFi-AP
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-unifi-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-unifi-squashfs-sysupgrade.bin
endif

ifeq ($(T),uap-pro)
  NAME:=Ubiquiti_UniFi-AP-PRO
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-uap-pro-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ar71xx-generic-ubnt-uap-pro-squashfs-sysupgrade.bin
endif

ifeq ($(T),vbox)
  NAME:=VirtualBox_x86
  ARCH:=x86
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=vm-qmp-big-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-x86-generic-combined-ext4.img.gz
endif

ifeq ($(T),vmware)
  NAME:=VMware_x86
  ARCH:=x86
  TBUILD:=lede
  PROFILE:=vm-qmp-big-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-x86-generic-combined-ext4.vmdk
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-x86-generic-combined-ext4.vmdk
endif

ifeq ($(T),vocore)
  NAME:=Vonger_VoCore
  ARCH:=ramips
  SUBARCH:=rt305x
  TBUILD:=lede
  PROFILE:=rt5350-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ramips-rt305x-vocore-squashfs-sysupgrade.bin
endif 

ifeq ($(T),microwrt)
  NAME:=Microduino_MicroWRT
  ARCH:=ramips
  SUBARCH:=mt7620
  TBUILD:=lede
  PROFILE:=mt7620-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ramips-mt7620-microwrt-squashfs-sysupgrade.bin
endif 

ifeq ($(T),wrtnode)
  NAME:=WRTnode_WRTnode
  ARCH:=ramips
  SUBARCH:=mt7620
  TBUILD:=lede
  PROFILE:=mt7620-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ramips-mt7620-wrtnode-squashfs-sysupgrade.bin
endif 

ifeq ($(T),wt1520-4m)
  NAME:=Nexx_WT1520-4M
  ARCH:=ramips
  SUBARCH:=rt305x
  TBUILD:=lede
  PROFILE:=rt5350-qmp-tiny-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ramips-rt305x-wt1520-4M-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ramips-rt305x-wt1520-4M-squashfs-sysupgrade.bin
endif

ifeq ($(T),wt1520-8m)
  NAME:=Nexx_WT1520-8M
  ARCH:=ramips
  SUBARCH:=rt305x
  TBUILD:=lede
  PROFILE:=rt5350-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ramips-rt305x-wt1520-8M-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ramips-rt305x-wt1520-8M-squashfs-sysupgrade.bin
endif

ifeq ($(T),wt3020-4m)
  NAME:=Nexx_WT3020-4M
  ARCH:=ramips
  SUBARCH:=mt7620
  TBUILD:=lede
  PROFILE:=mt7620_kstrip-qmp-tiny-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ramips-mt7620-wt3020-4M-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ramips-mt7620-wt3020-4M-squashfs-sysupgrade.bin
endif

ifeq ($(T),wt3020-8m)
  NAME:=Nexx_WT3020-8M
  ARCH:=ramips
  SUBARCH:=mt7620
  TBUILD:=lede
  PROFILE:=mt7620-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ramips-mt7620-wt3020-8M-squashfs-factory.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ramips-mt7620-wt3020-8M-squashfs-sysupgrade.bin
endif

ifeq ($(T),miwifi-mini)
  NAME:=Xiaomi_MiWiFi-Mini
  ARCH:=ramips
  SUBARCH:=mt7620
  TBUILD:=lede
  PROFILE:=mt7620-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ramips-mt7620-miwifi-mini-squashfs-sysupgrade.bin
  SYSUPGRADE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ramips-mt7620-miwifi-mini-squashfs-sysupgrade.bin
endif 

ifeq ($(T),dir-810l)
  NAME:=D-Link_DIR-810L
  ARCH:=ramips
  SUBARCH:=mt7620
  TBUILD:=lede
  PROFILE:=mt7620-qmp-small-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-ramips-mt7620-dir-810l-squashfs-sysupgrade.bin
endif 

ifeq ($(T),kvm)
  NAME:=KVM_x86
  ARCH:=x86
  SUBARCH:=kvm_guest
  TBUILD:=lede
  PROFILE:=kvm-qmp-big-node
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/qmp-x86-kvm_guest-combined-ext4.img.gz
endif

ifeq ($(T),ar71xx-generic-ib)
  NAME:=ar71xx_generic_imagebuilder
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ar71xx-generic-imagebuilder
  override MAKE_SRC = -j$(J) V=$(V) IGNORE_ERRORS=1
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/LEDE-ImageBuilder-$(ARCH)_generic-for-linux-x86_64.tar.bz2 ImageBuilder-qMp-$(ARCH)-x86_64.tar.bz2
endif

ifeq ($(T),ath25-generic-ib)
  NAME:=ath25_generic_imagebuilder
  ARCH:=ath25
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=ath25-generic-imagebuilder
  override MAKE_SRC = -j$(J) V=$(V) IGNORE_ERRORS=1
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/LEDE-ImageBuilder-$(ARCH)_generic-for-linux-x86_64.tar.bz2 ImageBuilder-qMp-$(ARCH)-x86_64.tar.bz2
endif

ifeq ($(T),mpc85xx-generic-ib)
  NAME:=mpc85xx_generic_imagebuilder
  ARCH:=mpc85xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=mpc85xx-generic-imagebuilder
  override MAKE_SRC = -j$(J) V=$(V) IGNORE_ERRORS=1
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/LEDE-ImageBuilder-$(ARCH)_generic-for-linux-x86_64.tar.bz2 ImageBuilder-qMp-$(ARCH)-x86_64.tar.bz2
endif

ifeq ($(T),ramips-mt7620-ib)
  NAME:=ramips_mt7620_imagebuilder
  ARCH:=ramips
  SUBARCH:=mt7620
  TBUILD:=lede
  PROFILE:=ramips-mt7620-imagebuilder
  override MAKE_SRC = -j$(J) V=$(V) IGNORE_ERRORS=1
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/LEDE-ImageBuilder-$(ARCH)_generic-for-linux-x86_64.tar.bz2 ImageBuilder-qMp-$(ARCH)-x86_64.tar.bz2
endif

ifeq ($(T),sunxi-generic-ib)
  NAME:=sunxi_imagebuilder
  ARCH:=sunxi
  TBUILD:=openwrt
  PROFILE:=sunxi-imagebuilder
  override MAKE_SRC = -j$(J) V=$(V) IGNORE_ERRORS=1
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/LEDE-ImageBuilder-$(ARCH)_generic-for-linux-x86_64.tar.bz2 ImageBuilder-qMp-$(ARCH)-x86_64.tar.bz2
endif

ifeq ($(T),ramips-rt305x-ib)
  NAME:=ramips_rt305x_imagebuilder
  ARCH:=ramips
  SUBARCH:=rt305x
  TBUILD:=lede
  PROFILE:=ramips-rt305x-imagebuilder
  override MAKE_SRC = -j$(J) V=$(V) IGNORE_ERRORS=1
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/LEDE-ImageBuilder-$(ARCH)_generic-for-linux-x86_64.tar.bz2 ImageBuilder-qMp-$(ARCH)-x86_64.tar.bz2
endif

ifeq ($(T),x86-generic-ib)
  NAME:=x86_generic_imagebuilder
  ARCH:=x86
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=x86-generic-imagebuilder
  override MAKE_SRC = -j$(J) V=$(V) IGNORE_ERRORS=1
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/LEDE-ImageBuilder-$(ARCH)_generic-for-linux-x86_64.tar.bz2 ImageBuilder-qMp-$(ARCH)-x86_64.tar.bz2
endif

ifeq ($(T),x86-geode-ib)
  NAME:=x86_geode_imagebuilder
  ARCH:=x86
  SUBARCH:=geode
  TBUILD:=lede
  PROFILE:=x86-geode-imagebuilder
  override MAKE_SRC = -j$(J) V=$(V) IGNORE_ERRORS=1
  IMAGE:=bin/targets/$(ARCH)/$(SUBARCH)/LEDE-ImageBuilder-$(ARCH)_generic-for-linux-x86_64.tar.bz2 ImageBuilder-qMp-$(ARCH)-x86_64.tar.bz2
endif
