# targets.mk
# Copyright (C) 2011-2016 qmp.cat
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

COMBINEDSQUASH := combined-squashfs.bin
SDCARDVFATEXT4 := sdcard-vfat-ext4.img
SQUASHFACTORY := squashfs-factory.bin
SQUASHSYSUPGRADE := squashfs-sysupgrade.bin

TINYPKG ?= qmp-tiny-node
SMALLPKG ?= qmp-small-node
BIGPKG ?= qmp-big-node

TBUILD_LIST := lede

DISTLEGACY:=lede

MP_AVAILABLE := ath25-generic ar71xx-generic brcm2708-bcm2708 brcm2708-bcm2709 brcm2708-bcm2710 ramips-mt7620 ramips-mt7621 ramips-mt7628 ramips-rt305x x86-geode
HW_AVAILABLE := alfa-nx bullet kvm nsm2 nsm5 nsm5-xw nslm5-xw rocket-m-xw pico2 rocket-m rs rspro mc-mac1200r tl-2543-v1 tl-wr703n-v1 tl-wr743nd-v1 tl-wr841-v7 tl-wr841-v8 tl-wr841-v9 tl-wr841-v10 tl-842n-v1 tl-mr3020-v1 tl-mr3040-v1 tl-wa7510n tl-wdr3500-v1 tl-wdr3600 tl-wdr4300 tl-wdr4900-v1 wpe72-8M dragino2 alix soekris45xx x86 uap-pro unifi-ap vbox vmware vocore-8M vocore-16M wt1520-4M wt1520-8M cf-wr800n dir-810l microwrt miwifi-mini wl-wn575a3 wrtnode wt3020-4M wt3020-8M zbt-ape522ii lamobo-r1 mpc85xx-generic-ib sunxi-generic-ib x86-generic-ib

ifeq ($(MPT),ath25-generic)
  TBUILD:=lede
  ARCH:=ath25
  SUBARCH:=generic
  DEVPKG:=CONFIG_TARGET_DEVICE_PACKAGES_$(ARCH)_DEVICE_
  TINY:=ubnt2-pico2
  SMALL:=
  BIG:=
endif

ifeq ($(MPT),ar71xx-generic)
  TBUILD:=lede
  ARCH:=ar71xx
  SUBARCH:=generic
  DEVPKG:=CONFIG_TARGET_DEVICE_PACKAGES_$(ARCH)_$(SUBARCH)_DEVICE_
  TINY:=tl-wr841-v7 tl-wr841-v8 tl-wr841-v9 tl-wr841-v10 tl-wr842n-v1 tl-wr703n-v1 tl-mr3020-v1 tl-mr3040-v1 tl-wa7510n tl-wr743nd-v1 tl-wr740n-v1
  SMALL:=ALFANX tl-wr2543-v1 ubnt-bullet-m ubnt-nano-m ubnt-nano-m-xw ubnt-loco-m-xw ubnt-rocket-m-xw ubnt-rocket-m mc-mac1200r WPE72_8M dragino2 ubnt-unifi ubnt-uap-pro
  BIG:=ubnt-rs ubnt-rspro tl-wdr3500-v1 tl-wdr3600-v1 tl-wdr4300-v1
endif

ifeq ($(MPT),brcm2708-bcm2708)
  TBUILD:=lede
  ARCH:=brcm2708
  SUBARCH:=bcm2708
  DEVPKG:=CONFIG_TARGET_DEVICE_PACKAGES_$(ARCH)_$(SUBARCH)_DEVICE_
  TINY:=
  SMALL:=
  BIG:=rpi
endif

ifeq ($(MPT),brcm2708-bcm2709)
  TBUILD:=lede
  ARCH:=brcm2708
  SUBARCH:=bcm2709
  DEVPKG:=CONFIG_TARGET_DEVICE_PACKAGES_$(ARCH)_$(SUBARCH)_DEVICE_
  TINY:=
  SMALL:=
  BIG:=rpi-2
endif

ifeq ($(MPT),brcm2708-bcm2710)
  TBUILD:=lede
  ARCH:=brcm2708
  SUBARCH:=bcm2710
  DEVPKG:=CONFIG_TARGET_DEVICE_PACKAGES_$(ARCH)_$(SUBARCH)_DEVICE_
  TINY:=
  SMALL:=
  BIG:=rpi-3
endif

ifeq ($(MPT),ramips-mt7620)
  TBUILD:=lede
  ARCH:=ramips
  SUBARCH:=mt7620
  DEVPKG:=CONFIG_TARGET_DEVICE_PACKAGES_$(ARCH)_$(SUBARCH)_DEVICE_$(DEVICE)
  TINY:=wt3020-4M
  SMALL:=cf-wr800n dir-810l microwrt miwifi-mini wrtnode wt3020-8M zbt-ape522ii
  BIG:=
endif

ifeq ($(MPT),ramips-mt7621)
  TBUILD:=lede
  ARCH:=ramips
  SUBARCH:=mt7621
  DEVPKG:=CONFIG_TARGET_DEVICE_PACKAGES_$(ARCH)_$(SUBARCH)_DEVICE_$(DEVICE)
  TINY:=
  SMALL:=
  BIG:=
endif

ifeq ($(MPT),ramips-mt7628)
  TBUILD:=lede
  ARCH:=ramips
  SUBARCH:=mt7628
  DEVPKG:=CONFIG_TARGET_DEVICE_PACKAGES_$(ARCH)_$(SUBARCH)_DEVICE_$(DEVICE)
  TINY:=
  SMALL:=wl-wn575a3
  BIG:=
endif

ifeq ($(MPT),ramips-rt305x)
  TBUILD:=lede
  ARCH:=ramips
  SUBARCH:=rt305x
  DEVPKG:=CONFIG_TARGET_DEVICE_PACKAGES_$(ARCH)_$(SUBARCH)_DEVICE_$(DEVICE)
  TINY:=wt1520-4M
  SMALL:=wt1520-8M
  BIG:=
endif

ifeq ($(MPT),x86-geode)
  TBUILD:=lede
  ARCH:=x86
  SUBARCH:=geode
  DEVPKG:=CONFIG_TARGET_DEVICE_PACKAGES_$(ARCH)_$(SUBARCH)_DEVICE_
  TINY:=
  SMALL:=
  BIG:=
endif

ifeq ($(T),alfa-nx)
  NAME:=Alfa-Network_N5
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  MPNAME:=ALFANX
  FACTORY:=$(DISTLEGACY)-$(ARCH)-$(SUBARCH)-$(T)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTLEGACY)-$(ARCH)-$(SUBARCH)-$(T)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),alix)
  NAME:=PC-Engines_Alix
  ARCH:=x86
  SUBARCH:=geode
  TBUILD:=lede
  MPNAME:=x86-geode
  COMBINEDSQUASH:=combined-squashfs.img
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(COMBINEDSQUASH)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(COMBINEDSQUASH)
endif

ifeq ($(T),x86)
  NAME:=Generic_x86
  ARCH:=x86
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=x86-qmp-big-node
  MPNAME:=
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(COMBINEDSQUASH)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(COMBINEDSQUASH)
endif

ifeq ($(T),soekris45xx)
  NAME:=Soekris_Net45xx
  ARCH:=x86
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=x86-qmp-big-node
  MPNAME:=
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(COMBINEDSQUASH)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(COMBINEDSQUASH)
endif

ifeq ($(T),bullet)
  NAME:=Ubiquiti_Bullet-M
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=ubnt-bullet-m
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),cf-wr800n)
  NAME:=Comfast_CF-WR800N
  ARCH:=ramips
  SUBARCH:=mt7620
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=cf-wr800n
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),nsm2)
  NAME:=Ubiquiti_NanoStation-M2
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=ubnt-nano-m
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),nsm5)
  NAME:=Ubiquiti_NanoStation-M5
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=ubnt-nano-m
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),nsm5-xw)
  NAME:=Ubiquiti_NanoStation-M5-XW
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=ubnt-nano-m-xw
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),nslm5-xw)
  NAME:=Ubiquiti_NanoStation-Loco-M5-XW
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=ubnt-loco-m-xw
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),lamobo-r1)
  NAME:=Lamobo_R1
  ARCH:=sunxi
  SUBARCH:=generic
  TBUILD:=lede
  MPNAME:=
  PROFILE:=sunxi-qmp-small-node
  IMAGE:=$(DISTCL)-$(ARCH)-$(NAME)-$(SDCARDVFATEXT4)
endif

ifeq ($(T),rocket-m-xw)
  NAME:=Ubiquiti_Rocket-M5-XW
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=ubnt-rocket-m-xw
  IMAGE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),pico2)
  NAME:=Ubiquiti_PicoStation-2
  ARCH:=ath25
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-tiny-node
  MPNAME:=ubnt2-pico2
  BUILD_PATH:=$(BUILD_DIR)/ath25
  FACTORY:=$(DISTCL)-$(ARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),rocket-m)
  NAME:=Ubiquiti_Rocket-M
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=ubnt-rocket-m
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),rs)
  NAME:=Ubiquiti_RouterStation
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-big-node
  MPNAME:=ubnt-rs
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),rspro)
  NAME:=Ubiquiti_RouterStation-Pro
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-big-node
  MPNAME:=ubnt-rspro
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),tl-2543-v1)
  NAME:=TP-Link_TL-WR2543ND-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=tl-wr2543-v1
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),mc-mac1200r)
  NAME:=Mercury_MAC1200R
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=mc-mac1200r
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),tl-wr841-v7)
  NAME:=TP-Link_TL-WR841-v7
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-tiny-node
  MPNAME:=tl-wr841-v7
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),tl-wr841-v8)
  NAME:=TP-Link_TL-WR841-v8
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-tiny-node
  MPNAME:=tl-wr841-v8
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),tl-wr841-v9)
  NAME:=TP-Link_TL-WR841-v9
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-tiny-node
  MPNAME:=tl-wr841-v9
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),tl-wr841-v10)
  NAME:=TP-Link_TL-WR841-v10
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-tiny-node
  MPNAME:=tl-wr841-v10
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),tl-842n-v1)
  NAME:=TP-Link_TL-WR842N-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-tiny-node
  MPNAME:=tl-wr842n-v1
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),tl-wr703n-v1)
  NAME:=TP-Link_TL-WR703N-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-tiny-node
  MPNAME:=tl-wr703n-v1
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif


ifeq ($(T),tl-mr3020-v1)
  NAME:=TP-Link_TL-MR3020-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-tiny-node
  MPNAME:=tl-mr3020-v1
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),tl-mr3040)
  NAME:=TP-Link_TL-MR3040-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-tiny-node
  MPNAME:=tl-mr3040-v1
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),tl-wa7510n)
  NAME:=TP-Link_TL-WA7510N
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-tiny-node
  MPNAME:=tl-wa7510n
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),tl-wdr3500-v1)
  NAME:=TP-Link_TL-WDR3500-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-big-node
  MPNAME:=tl-wdr3500-v1
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),tl-wdr3600)
  NAME:=TP-Link_TL-WDR3600-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-big-node
  MPNAME:=tl-wdr3600-v1
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),tl-wdr4300)
  NAME:=TP-Link_TL-WDR4300-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-big-node
  MPNAME:=tl-wdr4300-v1
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),tl-wdr4900-v1)
  NAME:=TP-Link_TL-WDR4900-v1
  ARCH:=mpc85xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=mpc85xx-qmp-big-node
  MPNAME:=
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(T)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)--$(ARCH)-$(SUBARCH)-$(T)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),tl-wr743nd-v1)
  NAME:=TP-Link_TL-WR743ND-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-tiny-node
  MPNAME:=tl-wr743nd-v1
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),tl-wr740n)
  NAME:=TP-Link_TL-WR740N-v1
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-tiny-node
  MPNAME:=-tl-wr740n-v1
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),wpe72-8M)
  NAME:=Compex_WPE72-8M
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=WPE72_8M
  FACTORY:=$(DISTLC)-$(ARCH)-$(SUBARCH)-wpe72-squashfs-8M-factory.img
  SYSUPGRADE:=$(DISTLC)-$(ARCH)-$(SUBARCH)-wpe72-squashfs-8M-sysupgrade.img
endif

ifeq ($(T),dragino2)
  NAME:=Dragino_MS14
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=dragino2
  FACTORY:=$(DISTLC)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTLC)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),unifi-ap)
  NAME:=Ubiquiti_UniFi-AP
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=ubnt-unifi
  IMAGE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),uap-pro)
  NAME:=Ubiquiti_UniFi-AP-PRO
  ARCH:=ar71xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=ubnt-uap-pro
  IMAGE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),vbox)
  NAME:=VirtualBox_x86
  ARCH:=x86
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=vm-qmp-big-node
  MPNAME:=
  IMAGE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-combined-ext4.vdi
endif

ifeq ($(T),vmware)
  NAME:=VMware_x86
  ARCH:=x86
  TBUILD:=lede
  SUBARCH:=generic
  PROFILE:=vm-qmp-big-node
  MPNAME:=
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-combined-ext4.vmdk
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-combined-ext4.vmdk
endif

ifeq ($(T),vocore-8M)
  NAME:=Vonger_VoCore-8M
  ARCH:=ramips
  SUBARCH:=rt305x
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=vocore-8M
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),vocore-16M)
  NAME:=Vonger_VoCore-16M
  ARCH:=ramips
  SUBARCH:=rt305x
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=vocore-16M
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),microwrt)
  NAME:=Microduino_MicroWRT
  ARCH:=ramips
  SUBARCH:=mt7620
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=microwrt
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),wl-wn575a3)
  NAME:=Wavlink_WL-WN575A3
  ARCH:=ramips
  SUBARCH:=mt7628
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=wl-wn575a3
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),wt1520-4M)
  NAME:=Nexx_WT1520-4M
  ARCH:=ramips
  SUBARCH:=rt305x
  TBUILD:=lede
  PROFILE:=qmp-tiny-node
  MPNAME:=wt1520-4M
  FACTORY:=$(DISTLEGACY)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTLEGACY)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),wt1520-8M)
  NAME:=Nexx_WT1520-8M
  ARCH:=ramips
  SUBARCH:=rt305x
  TBUILD:=lede
  PROFILE:=rt5350-qmp-small-node
  MPNAME:=wt1520-8M
  FACTORY:=$(DISTLEGACY)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTLEGACY)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),dir-810l)
  NAME:=D-Link_DIR-810L
  ARCH:=ramips
  SUBARCH:=mt7620
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=dir-810l
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),miwifi-mini)
  NAME:=Xiaomi_MiWiFi-Mini
  ARCH:=ramips
  SUBARCH:=mt7620
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=miwifi-mini
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),wrtnode)
  NAME:=WRTnode_WRTnode
  ARCH:=ramips
  SUBARCH:=mt7620
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=wrtnode
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),wt3020-4M)
  NAME:=Nexx_WT3020-4M
  ARCH:=ramips
  SUBARCH:=mt7620
  TBUILD:=lede
  PROFILE:=qmp-tiny-node
  MPNAME:=wt3020-4M
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),wt3020-8M)
  NAME:=Nexx_WT3020-8M
  ARCH:=ramips
  SUBARCH:=mt7620
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=wt3020-8M
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHFACTORY)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),zbt-ape522ii)
  NAME:=ZBT_APE522II
  ARCH:=ramips
  SUBARCH:=mt7620
  TBUILD:=lede
  PROFILE:=qmp-small-node
  MPNAME:=zbt-ape522ii
  FACTORY:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
  SYSUPGRADE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-$(MPNAME)-$(SQUASHSYSUPGRADE)
endif

ifeq ($(T),kvm)
  NAME:=KVM_x86
  ARCH:=x86
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=kvm-qmp-big-node
  MPNAME:=
  IMAGE:=$(DISTCL)-$(ARCH)-$(SUBARCH)-combined-ext4.img.gz
endif

ifeq ($(T),mpc85xx-generic-ib)
  NAME:=mpc85xx_generic_imagebuilder
  ARCH:=mpc85xx
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=mpc85xx-generic-imagebuilder
  override MAKE_SRC = -j$(J) V=$(V) IGNORE_ERRORS=1
  MPNAME:=
  IMAGE:=LEDE-ImageBuilder-$(ARCH)_generic-for-linux-x86_64.tar.bz2 ImageBuilder-qMp-$(ARCH)-x86_64.tar.bz2
endif

ifeq ($(T),sunxi-generic-ib)
  NAME:=sunxi_imagebuilder
  ARCH:=sunxi
  TBUILD:=lede
  PROFILE:=sunxi-imagebuilder
  override MAKE_SRC = -j$(J) V=$(V) IGNORE_ERRORS=1
  MPNAME:=
  IMAGE:=LEDE-ImageBuilder-$(ARCH)_generic-for-linux-x86_64.tar.bz2 ImageBuilder-qMp-$(ARCH)-x86_64.tar.bz2
endif

ifeq ($(T),x86-generic-ib)
  NAME:=x86_generic_imagebuilder
  ARCH:=x86
  SUBARCH:=generic
  TBUILD:=lede
  PROFILE:=x86-generic-imagebuilder
  override MAKE_SRC = -j$(J) V=$(V) IGNORE_ERRORS=1
  MPNAME:=
  IMAGE:=LEDE-ImageBuilder-$(ARCH)_generic-for-linux-x86_64.tar.bz2 ImageBuilder-qMp-$(ARCH)-x86_64.tar.bz2
endif

ifeq ($(T),x86-64-ib)
  NAME:=x86_64_imagebuilder
  ARCH:=x86
  SUBARCH:=64
  TBUILD:=lede
  PROFILE:=x86-64-imagebuilder
  override MAKE_SRC = -j$(J) V=$(V) IGNORE_ERRORS=1
  MPNAME:=
  IMAGE:=LEDE-ImageBuilder-$(ARCH)_generic-for-linux-x86_64.tar.bz2 ImageBuilder-qMp-$(ARCH)-x86_64.tar.bz2
endif

DEVPKG ?= CONFIG_TARGET_DEVICE_PACKAGES_$(ARCH)_$(SUBARCH)_DEVICE_$(DEVICE)=$PROFILE
