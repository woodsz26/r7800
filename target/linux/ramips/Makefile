#
# Copyright (C) 2008-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=mipsel
BOARD:=ramips
BOARDNAME:=MediaTek Ralink MIPS
SUBTARGETS:=rt305x mt7620 mt7621 mt7628 mt7688 rt3883 rt288x
FEATURES:=squashfs gpio
MAINTAINER:=John Crispin <john@phrozen.org>

KERNEL_PATCHVER:=4.9

define Target/Description
	Build firmware images for Ralink RT288x/RT3xxx based boards.
endef

include $(INCLUDE_DIR)/target.mk
DEFAULT_PACKAGES += \
	kmod-leds-gpio kmod-gpio-button-hotplug swconfig \
	block-mount e2fsprogs openssl-util luci luci-app-minidlna \
	luci-app-transmission transmission-daemon-openssl \
	kmod-usb-storage kmod-fs-ext4 minidlna nano htop rng-tools\
	aria2 luci-app-aria2 samba36-server luci-app-samba

$(eval $(call BuildTarget))
