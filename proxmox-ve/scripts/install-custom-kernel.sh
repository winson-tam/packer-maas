#!/bin/bash -eux
#
# install-custom-kernel.sh - Install Proxmox VE kernel if specified
#

export DEBIAN_FRONTEND=noninteractive

if [ -z "${PROXMOX_KERNEL_PACKAGE}" ]; then
  echo "No custom kernel specified. Skipping kernel installation."
  exit 0
fi

echo "Installing Proxmox VE kernel: ${PROXMOX_KERNEL_PACKAGE}"
apt-get install -y "${PROXMOX_KERNEL_PACKAGE}"

# Record the installed kernel version for curtin
mkdir -p /curtin
echo -n "${PROXMOX_KERNEL_PACKAGE}" > /curtin/CUSTOM_KERNEL
