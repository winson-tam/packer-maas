#!/bin/bash -eux
#
# setup-boot.sh - Finalize boot setup for Proxmox VE
#

export DEBIAN_FRONTEND=noninteractive

# Clean up cloud-init logs
cloud-init clean --logs

# Update package lists
apt-get update

# Install necessary bootloader packages
if [ "${BOOT_MODE}" == "uefi" ]; then
  apt-get install -y grub-efi-amd64-signed shim-signed
else
  apt-get install -y grub-pc
fi

# Install Proxmox VE kernel if not already installed
if ! dpkg -l | grep -qw 'pve-kernel'; then
  apt-get install -y pve-kernel-5.15
fi

# Ensure efibootmgr is installed for UEFI systems
if [ "${BOOT_MODE}" == "uefi" ]; then
  apt-get install -y efibootmgr
fi
