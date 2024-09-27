#!/bin/bash -eux
#
# networking.sh - Configure networking for Proxmox VE
#

# Disable Predictable Network Interface Names
sed -i 's/en[[:alnum:]]*/eth0/' /etc/network/interfaces
ln -s /dev/null /etc/udev/rules.d/80-net-setup-link.rules

# Update GRUB configuration
sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"/' /etc/default/grub
update-grub

# Clean up cloud-init network configuration
rm -f /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg
