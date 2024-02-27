#!/bin/bash
#set -e
##################################################################################################################
# Author  :  anisbsalah
# Github  :  https://github.com/anisbsalah
##################################################################################################################
#
# DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
# CURRENT_DIR="$(pwd)"
##################################################################################################################

sudo swapoff /swap/swapfile
sudo rm -rf /swap/swapfile
sudo umount /swap
sudo rm -rf /swap
sudo sed -i '/swap/d' /etc/fstab
sudo systemctl daemon-reload

ROOT_BTRFS_FS=$(df --output=source / | tail -n 1)
sudo mount "${ROOT_BTRFS_FS}" /mnt

sudo btrfs subvolume delete /mnt/@swap
sudo umount /mnt
sudo mount -av
