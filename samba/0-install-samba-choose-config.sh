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
CURRENT_DIR="$(pwd)"
##################################################################################################################

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Installation of Samba software..."
echo "######################################################################################################"
tput sgr0
echo

sudo apt install -y samba

echo

[[ ! -f /etc/samba/smb.conf ]] || sudo cp -anv /etc/samba/smb.conf /etc/samba/smb.conf.bak
sudo cp "${CURRENT_DIR}/config/"* /etc/samba/
sudo cp -f "${CURRENT_DIR}/config/smb.conf.easy" /etc/samba/smb.conf

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Create a password for the current user to be able to access Samba server"
echo "######################################################################################################"
echo
tput sgr0

#read -erp "What is your login? It will be used to add this user to smb : " choice
#sudo smbpasswd -a "${choice}"

sudo smbpasswd -a "${USER}"

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Samba configuration"
echo "######################################################################################################"
tput sgr0
echo
echo "Choose your Samba configuration (enter a number):"
echo "1) Easy"
echo "2) Usershares"
echo
read -erp "#? " CHOICE
echo

case ${CHOICE} in

1)
	sudo cp -fv /etc/samba/smb.conf.easy /etc/samba/smb.conf
	[[ -d "${HOME}/SHARED" ]] || mkdir -p "${HOME}/SHARED"

	;;
2)
	sudo cp -fv /etc/samba/smb.conf.usershares /etc/samba/smb.conf
	[[ -d /var/lib/samba/usershares ]] || sudo mkdir -p /var/lib/samba/usershares

	echo
	tput setaf 3
	echo "######################################################################################################"
	echo "################# Create a user group and add the user to the sambashare group"
	echo "######################################################################################################"
	echo
	tput sgr0

	sudo groupadd -r sambashare
	sudo gpasswd sambashare -a "${USER}"
	sudo chown root:sambashare /var/lib/samba/usershares
	sudo chmod 1770 /var/lib/samba/usershares

	echo
	tput setaf 3
	echo "######################################################################################################"
	echo "################# Installing file sharing plugins..."
	echo "######################################################################################################"
	echo
	tput sgr0

	if dpkg -s caja &>/dev/null; then
		sudo apt install -y caja-share
	fi

	if dpkg -s dolphin &>/dev/null; then
		sudo apt install -y kdenetwork-filesharing
	fi

	if dpkg -s nautilus &>/dev/null; then
		sudo apt install -y nautilus-share
	fi

	if dpkg -s nemo &>/dev/null; then
		sudo apt install -y nemo-share
	fi

	;;
*)
	echo
	tput setaf 9
	echo "######################################################################################################"
	echo "################# Choose the correct number"
	echo "################# No configuration set"
	echo "######################################################################################################"
	echo
	tput sgr0
	;;
esac

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Enabling services"
echo "######################################################################################################"
echo
tput sgr0

sudo systemctl enable --now smbd.service
sudo systemctl enable --now nmbd.service

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Network Discovery"
echo "######################################################################################################"
echo
tput sgr0

sudo apt install -y avahi-daemon avahi-utils avahi-autoipd
sudo systemctl enable --now avahi-daemon.service

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Configuring the firewall service"
echo "######################################################################################################"
echo
tput sgr0

sudo ufw allow samba

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Samba has been installed"
echo "################# Now reboot before sharing folders!"
echo "######################################################################################################"
tput sgr0
echo
