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
tput setaf 6
echo "######################################################################################################"
echo "SWAP"
echo "######################################################################################################"
tput sgr0
echo
tput setaf 12
echo "######################################################################################################"
echo "Do you want to create a swap file on your system?"
echo "Answer with [Y/y] or [N/n]"
echo "######################################################################################################"
read -erp "Type your answer: " response
echo "######################################################################################################"
tput sgr0

case ${response} in

y | Y | yes | Yes | YES | 1)

	if [[ -f /swap/swapfile ]]; then

		echo
		tput setaf 13
		echo "######################################################################################################"
		echo "################# There is already a swap file"
		echo "################# Nothing to do"
		echo "######################################################################################################"
		tput sgr0
		echo

	else

		if [[ -f /swapfile ]]; then

			sudo swapoff /swapfile
			sudo rm -f /swapfile
			sudo sed -i '\|^/swapfile|d' /etc/fstab
		fi

		ROOT_BTRFS_FS=$(df --output=source / | tail -n 1)
		UUID_ROOT=$(lsblk -dno UUID "${ROOT_BTRFS_FS}")
		#UUID_ROOT=$(blkid -s UUID -o value "${ROOT_BTRFS_FS}")

		sudo mount "${ROOT_BTRFS_FS}" /mnt
		#sudo mount "${ROOT_BTRFS_FS}" -o subvolid=5 /mnt
		#sudo mount -t btrfs -o subvol=/ /dev/disk/by-uuid/"${UUID_ROOT}" /mnt

		echo

		sudo btrfs subvolume create /mnt/@swap

		sudo umount /mnt

		sudo mkdir /swap

		sudo mount -o defaults,noatime,subvol=@swap "${ROOT_BTRFS_FS}" /swap

		echo

		### Get the kernel version
		KERNEL_VERSION=$(uname -r | cut -d '.' -f 1-2)

		### Get the ram size in bytes
		RAM_SIZE_B=$(free -b -t | awk 'NR == 2 {print $2}')

		### Check if the kernel is version 6.1 or newer
		if (($(echo "${KERNEL_VERSION} >= 6.1" | bc -l))); then

			### Create a swapfile using btrfs if the kernel version is 6.1 or newer
			sudo btrfs filesystem mkswapfile --size "${RAM_SIZE_B}" --uuid clear /swap/swapfile

		else

			### Create a swapfile using traditional methods if the kernel version is older than 6.1
			sudo truncate -s 0 /swap/swapfile

			sudo chattr +C /swap/swapfile

			sudo btrfs property set /swap/swapfile compression none # maybe not necessary

			sudo fallocate -l "${RAM_SIZE_B}" /swap/swapfile
			#sudo fallocate -l 3G /swap/swapfile
			#sudo fallocate -l 3072M /swap/swapfile
			#sudo fallocate --length 3G /swap/swapfile

			sudo chmod 0600 /swap/swapfile

			sudo mkswap /swap/swapfile
		fi

		echo

		#sudo bash -c "echo UUID=$(lsblk -no UUID "${ROOT_BTRFS_FS}")   /swap   btrfs   defaults,noatime,subvol=@swap   0   0 >> /etc/fstab"
		#echo -e "\nUUID=$(lsblk -no UUID "${ROOT_BTRFS_FS}") /swap           btrfs   defaults,noatime,subvol=@swap 0       0" | sudo tee -a /etc/fstab
		echo "UUID=$(lsblk -no UUID "${ROOT_BTRFS_FS}") /swap           btrfs   defaults,noatime,subvol=@swap 0       0" | sudo tee -a /etc/fstab

		echo

		#sudo bash -c "echo /swap/swapfile  swap    swap    defaults    0   0 >> /etc/fstab"
		echo "/swap/swapfile                            swap            swap    defaults      0       0" | sudo tee -a /etc/fstab

		echo

		sudo systemctl daemon-reload
		sudo mount -av

		sudo swapon /swap/swapfile
		#sudo swapon -p 100 /swap/swapfile
		#sudo swapon --priority 100 /swap/swapfile

		sudo systemctl daemon-reload

		echo
		tput setaf 2
		echo "######################################################################################################"
		echo "################# Swap file created successfully"
		echo "######################################################################################################"
		tput sgr0
		echo
	fi
	;;

n | N | no | No | NO | 0)

	echo
	tput setaf 13
	echo "######################################################################################################"
	echo "################# We did nothing as per your request"
	echo "######################################################################################################"
	tput sgr0
	echo
	;;
*)
	echo
	tput setaf 9
	echo "######################################################################################################"
	echo "Invalid choice."
	echo "Try again."
	echo "######################################################################################################"
	tput sgr0

	exec "${0}"
	exit $?
	;;

esac

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Installing zram..."
echo "######################################################################################################"
tput sgr0
echo

sudo apt install -y zram-tools

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Editing config file"
echo "######################################################################################################"
tput sgr0

echo "
ALGO=zstd
PERCENT=70" | sudo tee -a /etc/default/zramswap

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Enabling zramswap service"
echo "######################################################################################################"
tput sgr0

sudo service zramswap reload

echo
tput setaf 2
echo "######################################################################################################"
echo "################# zram has been installed"
echo "######################################################################################################"
tput sgr0
echo

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Decreasing swappiness value"
echo "######################################################################################################"
tput sgr0
echo

# ### To display swappiness value
# cat /proc/sys/vm/swappiness

echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
#echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.d/99-swappiness.conf

sudo systemctl restart systemd-sysctl.service

echo
tput setaf 2
echo "######################################################################################################"
echo "################# New swappiness value set"
echo "######################################################################################################"
tput sgr0
echo
