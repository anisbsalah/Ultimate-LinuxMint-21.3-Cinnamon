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

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Installing grub-btrfs..."
echo "######################################################################################################"
tput sgr0
echo

sudo apt install -y git inotify-tools
git clone https://github.com/Antynea/grub-btrfs.git /tmp/grub-btrfs
cd /tmp/grub-btrfs || exit 1

### Pass "--timeshift-auto" to grub-btrfsd for newer Timeshift versions
sudo sed -i 's/ExecStart=\/usr\/bin\/grub-btrfsd --syslog \/.snapshots/ExecStart=\/usr\/bin\/grub-btrfsd --syslog --timeshift-auto/' grub-btrfsd.service

sudo make install

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Enabling & starting grub-btrfsd daemon"
echo "######################################################################################################"
tput sgr0
echo

sudo systemctl enable --now grub-btrfsd.service

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Updating grub"
echo "######################################################################################################"
tput sgr0
echo

sudo grub-mkconfig

sudo /etc/grub.d/41_snapshots-btrfs

sudo grub-mkconfig -o /boot/grub/grub.cfg

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Packages have been installed"
echo "######################################################################################################"
tput sgr0
echo
