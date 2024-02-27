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

# Source fedora 23 : https://opsech.io/posts/2016/Apr/06/sharing-files-with-kde-and-samba.html

echo
if dpkg -s samba &>/dev/null; then
	tput setaf 2
	echo "######################################################################################################"
	echo "################# Samba is installed"
	echo "######################################################################################################"
	tput sgr0
else
	tput setaf 9
	echo "######################################################################################################"
	echo "################# First use our script to install Samba and Network Discovery"
	echo "######################################################################################################"
	tput sgr0
	exit 1
fi

FILE=/etc/samba/smb.conf

if test -f "${FILE}"; then
	echo
	tput setaf 2
	echo "~> /etc/samba/smb.conf has been found"
	tput sgr0
else
	tput setaf 9
	echo "######################################################################################################"
	echo "################# We did not find /etc/samba/smb.conf"
	echo "################# First use our script to install Samba and Network Discovery"
	echo "######################################################################################################"
	tput sgr0
	exit 1
fi

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Installing file sharing plugins..."
echo "######################################################################################################"
echo
tput sgr0

# Checking if filemanager is installed then install extra packages
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

echo
tput setaf 3
echo "######################################################################################################"
echo "################# usershares configuration"
echo "######################################################################################################"
echo
tput sgr0

file="/etc/samba/smb.conf"

sudo sed -i '/^\[global\]/a \
\
usershare path = /var/lib/samba/usershares \
usershare max shares = 100 \
usershare allow guests = yes \
usershare owner only = yes' "${file}"

[[ -d /var/lib/samba/usershares ]] || sudo mkdir -p /var/lib/samba/usershares
sudo groupadd -r sambashare
sudo gpasswd -a "${USER}" sambashare
sudo chown root:sambashare /var/lib/samba/usershares
sudo chmod 1770 /var/lib/samba/usershares

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Now reboot before sharing folders!"
echo "######################################################################################################"
tput sgr0
echo
