# Use the default kernel version if the Makefile doesn't override it

LINUX_RELEASE?=1

LINUX_VERSION-3.18 = .43
LINUX_VERSION-4.4 = .71
LINUX_VERSION-4.9 = .31
LINUX_VERSION-4.11 = .5

LINUX_KERNEL_HASH-3.18.43 = 1236e8123a6ce537d5029232560966feed054ae31776fe8481dd7d18cdd5492c
LINUX_KERNEL_HASH-4.4.71 = 44cd5532d6df32197fd0f89e6f8c542fcfb76b52155a4d3a609ef4898522e6ab
LINUX_KERNEL_HASH-4.9.31 = 28cad8b66216da2550155b7a77f37041bde40b821567d1b288e5e9fb6cca9856
LINUX_KERNEL_HASH-4.11.5 = f7464c57e948a2597ea129c3f71909ccba7f02d297812cee74d694f823f16d4c

ifdef KERNEL_PATCHVER
  LINUX_VERSION:=$(KERNEL_PATCHVER)$(strip $(LINUX_VERSION-$(KERNEL_PATCHVER)))
endif

split_version=$(subst ., ,$(1))
merge_version=$(subst $(space),.,$(1))
KERNEL_BASE=$(firstword $(subst -, ,$(LINUX_VERSION)))
KERNEL=$(call merge_version,$(wordlist 1,2,$(call split_version,$(KERNEL_BASE))))
KERNEL_PATCHVER ?= $(KERNEL)

# disable the md5sum check for unknown kernel versions
LINUX_KERNEL_HASH:=$(LINUX_KERNEL_HASH-$(strip $(LINUX_VERSION)))
LINUX_KERNEL_HASH?=x
