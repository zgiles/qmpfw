# targets.mk
# Copyright (C) 2011-2016 qmp.cat
#
# This is free software, licensed under the GNU General Public License v3.
# See LICENSE for more information.
#
# ToDo: document this file once the multi-profile

MP_ARCHS := ar71xx-generic-mp ramips-mt7620-mp
TBUILD_LIST := lede

TINYPKG ?= qmp-tiny-node
SMALLPKG ?= qmp-small-node
BIGPKG ?= qmp-big-node

ifeq ($(MPT),ar71xx-generic-mp)
  TBUILD:=lede
  ARCH:=ar71xx
  SUBARCH:=generic
  DEVPKG:=CONFIG_TARGET_DEVICE_PACKAGES_$(ARCH)_$(SUBARCH)_DEVICE_
  TINY:=tl-wr841-v7 tl-wr841-v8 tl-wr841-v9 tl-wr841-v10 tl-wr842n-v1 tl-wr703n-v1 tl-mr3020-v1 tl-mr3040-v1 tl-wa7510n tl-wr743nd-v1 tl-wr740n-v1
  SMALL:=ALFANX tl-wr2543-v1 ubnt-bullet-m ubnt-nano-m ubnt-nano-m-xw ubnt-loco-m-xw ubnt-rocket-m-xw ubnt-rocket-m mc-mac1200r WPE72_8M dragino2 ubnt-unifi ubnt-uap-pro
  BIG:=ubnt-rs ubnt-rspro tl-wdr3500-v1 tl-wdr3600-v1 tl-wdr4300-v1
endif

ifeq ($(MPT),ramips-mt7620-mp)
  TBUILD:=lede
  ARCH:=ramips
  SUBARCH:=mt7620
  DEVPKG:=CONFIG_TARGET_DEVICE_PACKAGES_$(ARCH)_$(SUBARCH)_DEVICE_$(DEVICE)
  TINY:=wt3020-4M
  SMALL:=cf-wr800n microwrt wrtnode wt3020-8M miwifi-mini dir-810l
  BIG:=
endif
