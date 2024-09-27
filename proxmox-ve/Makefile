#!/usr/bin/make -f

include ../scripts/check.mk

PACKER ?= packer
PACKER_LOG ?= 0
export PACKER_LOG

SERIES ?= bullseye
BOOT ?= uefi
ARCH ?= amd64
TIMEOUT ?= 1h

ifneq ($(strip $(SERIES)),bullseye)
	$(error Only bullseye is supported for Proxmox VE)
endif

# Safeguard
ifeq ($(strip $(ARCH)),arm64)
	BOOT = uefi
endif

.PHONY: all clean

all: proxmox-ve

$(eval $(call check_packages_deps,cloud-image-utils ovmf,cloud-image-utils ovmf))

lint:
	packer validate .
	packer fmt -check -diff .

format:
	packer fmt .

OVMF_VARS.fd: /usr/share/OVMF/OVMF_VARS.fd
	cp -v $< $@

proxmox-ve: check-deps clean
	${PACKER} init . && ${PACKER} build \
		-var debian_series=${SERIES} \
		-var debian_version=11 \
		-var architecture=${ARCH} \
		-var boot_mode=${BOOT} \
		-var timeout=${TIMEOUT} .

clean:
	${RM} -rf output-* proxmox-ve-cloudimg.tar.gz \
		seeds-cloudimg.iso \
		OVMF_VARS.fd \
		AAVMF_VARS.fd

.INTERMEDIATE: OVMF_VARS.fd seeds-cloudimg.iso
