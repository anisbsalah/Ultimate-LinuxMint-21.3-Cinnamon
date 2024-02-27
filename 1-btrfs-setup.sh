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

if lsblk -f | grep btrfs >/dev/null 2>&1; then

	echo
	tput setaf 6
	echo "######################################################################################################"
	echo "You are using BTRFS"
	echo "######################################################################################################"
	tput sgr0

	tput setaf 3
	echo "######################################################################################################"
	echo "################# Installing Timeshift..."
	echo "######################################################################################################"
	tput sgr0
	echo

	sudo apt install -y timeshift

	echo
	tput setaf 3
	echo "######################################################################################################"
	echo "################# Installing timeshift-autosnap-apt..."
	echo "######################################################################################################"
	tput sgr0
	echo

	sudo apt install -y git make

	git clone https://github.com/wmutschl/timeshift-autosnap-apt.git /tmp/timeshift-autosnap-apt
	cd /tmp/timeshift-autosnap-apt || exit 1
	sed -i 's/maxSnapshots=3/maxSnapshots=7/' timeshift-autosnap-apt.conf
	sed -i '/snapshotDescription=/s/.*/snapshotDescription={pre APT snapshot}/' timeshift-autosnap-apt.conf
	sudo make install

	echo
	tput setaf 3
	echo "######################################################################################################"
	echo "################# Installing inotify-tools..."
	echo "######################################################################################################"
	tput sgr0
	echo

	sudo apt install -y inotify-tools

	echo
	tput setaf 3
	echo "######################################################################################################"
	echo "################# Installing grub-btrfs..."
	echo "######################################################################################################"
	tput sgr0
	echo

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

else

	echo
	tput setaf 9
	echo "######################################################################################################"
	echo "################# Your harddisk/ssd/nvme is not formatted as BTRFS"
	echo "################# Packages will not be installed"
	echo "######################################################################################################"
	tput sgr0
	echo

fi
