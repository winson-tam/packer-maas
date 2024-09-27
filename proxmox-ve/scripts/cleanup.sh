#!/bin/bash -eux
#
# cleanup.sh - Clean up the image before creating the final tarball
#

# Remove temporary files
rm -rf /tmp/*

# Remove SSH host keys
rm -f /etc/ssh/ssh_host_*

# Clean up apt cache
apt-get clean
rm -rf /var/lib/apt/lists/*

# Remove shell history
unset HISTFILE
rm -f /root/.bash_history
rm -f /home/*/.bash_history

# Zero out the free space to reduce the image size
dd if=/dev/zero of=/EMPTY bs=1M || true
rm -f /EMPTY

# Sync data to disk
sync

exit 0
