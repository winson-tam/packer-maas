#!/bin/bash -eux
#
# setup-curtin.sh - Set up curtin configurations for Proxmox VE
#

# Check if CUSTOM_KERNEL file exists
if [ ! -f "/curtin/CUSTOM_KERNEL" ]; then
  echo "No custom kernel specified. Skipping curtin setup."
  exit 0
fi

echo "Configuring curtin to install Proxmox VE kernel"

# Move curtin-hooks to /curtin
if [ -f "/tmp/curtin-hooks" ]; then
  mv "/tmp/curtin-hooks" /curtin/
  chmod +x /curtin/curtin-hooks
fi
