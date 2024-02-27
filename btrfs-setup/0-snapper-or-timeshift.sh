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
	tput setaf 12
	echo "######################################################################################################"
	echo "################# You are using BTRFS"
	echo "######################################################################################################"
	tput sgr0
	echo
	echo "Select the system restore utility to install:"
	echo "0) Do nothing"
	echo "1) Snapper"
	echo "2) Timeshift"
	echo
	read -erp "Enter a number (0/1/2): " CHOICE
	echo

	case ${CHOICE} in

	0)
		tput setaf 13
		echo "######################################################################################################"
		echo "################# We did nothing as per your request"
		echo "######################################################################################################"
		tput sgr0
		echo
		;;
	1)
		tput setaf 3
		echo "######################################################################################################"
		echo "################# Snapper to be installed..."
		echo "######################################################################################################"
		tput sgr0
		echo

		if [[ -d /.snapshots ]]; then
			sudo umount /.snapshots
			sudo rm -rf /.snapshots
		fi

		sudo apt install -y snapper snapper-gui

		### Install snapper-rollback
		### snapper-rollback requires python3-btrfsutil to be installed
		sudo apt install -y git python3-btrfsutil
		git clone https://github.com/jrabinow/snapper-rollback.git /tmp/snapper-rollback
		ROOT_BTRFS_FS=$(df --output=source / | tail -n 1)
		sed -i "s|^#dev = /dev/sda42|dev = ${ROOT_BTRFS_FS}|" /tmp/snapper-rollback/snapper-rollback.conf
		sudo cp -v /tmp/snapper-rollback/snapper-rollback.py /usr/local/bin/snapper-rollback
		sudo cp -v /tmp/snapper-rollback/snapper-rollback.conf /etc/

		echo
		tput setaf 3
		echo "######################################################################################################"
		echo "################# Creating snapper configuration for root"
		echo "######################################################################################################"
		tput sgr0
		echo

		sudo snapper -c root create-config /

		sudo snapper -c root set-config 'ALLOW_GROUPS=sudo'
		sudo snapper -c root set-config 'SYNC_ACL=yes'
		sudo snapper -c root set-config 'NUMBER_LIMIT=10'
		sudo snapper -c root set-config 'TIMELINE_CREATE=yes'
		sudo snapper -c root set-config 'TIMELINE_LIMIT_HOURLY=5'
		sudo snapper -c root set-config 'TIMELINE_LIMIT_DAILY=7'
		sudo snapper -c root set-config 'TIMELINE_LIMIT_WEEKLY=0'
		sudo snapper -c root set-config 'TIMELINE_LIMIT_MONTHLY=0'
		sudo snapper -c root set-config 'TIMELINE_LIMIT_YEARLY=0'

		echo
		tput setaf 3
		echo "######################################################################################################"
		echo "################# Creating snapper configuration for home"
		echo "######################################################################################################"
		tput sgr0
		echo

		sudo snapper -c home create-config /home

		sudo snapper -c home set-config 'ALLOW_GROUPS=sudo'
		sudo snapper -c home set-config 'SYNC_ACL=yes'
		sudo snapper -c home set-config 'NUMBER_LIMIT=10'
		sudo snapper -c home set-config 'TIMELINE_CREATE=no'
		sudo snapper -c home set-config 'TIMELINE_LIMIT_HOURLY=5'
		sudo snapper -c home set-config 'TIMELINE_LIMIT_DAILY=7'
		sudo snapper -c home set-config 'TIMELINE_LIMIT_WEEKLY=0'
		sudo snapper -c home set-config 'TIMELINE_LIMIT_MONTHLY=0'
		sudo snapper -c home set-config 'TIMELINE_LIMIT_YEARLY=0'

		echo
		tput setaf 3
		echo "######################################################################################################"
		echo "################# Creating snapshots directory & setting permissions to access for non-root users"
		echo "######################################################################################################"
		tput sgr0
		echo

		sudo btrfs subvolume delete /.snapshots

		sudo mkdir /.snapshots
		sudo chmod 750 /.snapshots
		sudo chmod a+rx /.snapshots
		sudo chown -R :users /.snapshots

		echo
		tput setaf 3
		echo "######################################################################################################"
		echo "################# Checking if @snapshots subvolume exists"
		echo "######################################################################################################"
		tput sgr0
		echo

		if sudo btrfs subvolume list / | grep -q '@snapshots'; then

			tput setaf 13
			echo '==> @snapshots subvolume already exists'
			tput sgr0
			echo

		else

			### Create @snapshots subvolume
			tput setaf 13
			echo '==> @snapshots subvolume being created...'
			tput sgr0
			echo

			ROOT_BTRFS_FS=$(df --output=source / | tail -n 1)
			UUID_ROOT=$(lsblk -dno UUID "${ROOT_BTRFS_FS}")

			#sudo mount "${ROOT_BTRFS_FS}" /mnt
			#sudo mount -o subvolid=5 "${ROOT_BTRFS_FS}" /mnt
			sudo mount -t btrfs -o subvol=/ /dev/disk/by-uuid/"${UUID_ROOT}" /mnt

			sudo btrfs subvolume create /mnt/@snapshots

			sudo umount /mnt

			#sudo mount -o defaults,noatime,compress=zstd,subvol=@snapshots "${ROOT_BTRFS_FS}" /.snapshots
			#echo -e "\nUUID=$(lsblk -no UUID "${ROOT_BTRFS_FS}") /.snapshots	btrfs	defaults,noatime,compress=zstd,subvol=@snapshots 0       0" | sudo tee -a /etc/fstab
			echo
			echo "UUID=$(lsblk -no UUID "${ROOT_BTRFS_FS}") /.snapshots	btrfs	defaults,noatime,compress=zstd,subvol=@snapshots 0       0" | sudo tee -a /etc/fstab

		fi

		echo
		sudo systemctl daemon-reload
		sudo mount -av

		echo
		tput setaf 3
		echo "######################################################################################################"
		echo "################# Snapper services"
		echo "######################################################################################################"
		tput sgr0
		echo

		sudo systemctl restart snapperd.service
		sudo systemctl restart snapper-cleanup.timer
		sudo systemctl restart snapper-timeline.timer
		sudo systemctl disable --now snapper-boot.timer

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

		sudo apt install -y git
		git clone https://github.com/Antynea/grub-btrfs.git /tmp/grub-btrfs
		cd /tmp/grub-btrfs || exit 1

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
		;;
	2)
		tput setaf 3
		echo "######################################################################################################"
		echo "################# Timeshift to be installed..."
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

		sudo apt install -y git
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
		;;
	*)
		tput setaf 9
		echo "######################################################################################################"
		echo "################# Choose the correct number"
		echo "################# Nothing installed - install manually"
		echo "######################################################################################################"
		tput sgr0
		echo
		;;
	esac

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
