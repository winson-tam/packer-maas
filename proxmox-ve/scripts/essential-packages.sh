#!/bin/bash -eux
#
# essential-packages.sh - Install essential packages and Proxmox VE repository
#

export DEBIAN_FRONTEND=noninteractive

# Configure apt proxy if needed
if [ -n "${http_proxy}" ]; then
  echo "Acquire::http::Proxy \"${http_proxy}\";" >> /etc/apt/apt.conf.d/01proxy
fi
if [ -n "${https_proxy}" ]; then
  echo "Acquire::https::Proxy \"${https_proxy}\";" >> /etc/apt/apt.conf.d/01proxy
fi

# Update package lists
apt-get update

# Install necessary packages
apt-get install -y lvm2 xfsprogs wget gnupg

# Add Proxmox VE repository and import the GPG key
wget -qO - https://enterprise.proxmox.com/debian/proxmox-release-bullseye.gpg | apt-key add -
echo "deb http://download.proxmox.com/debian/pve bullseye pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list

# Update package lists again
apt-get update
