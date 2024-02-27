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
echo "################# Installing Samba with easy configuration..."
echo "######################################################################################################"
tput sgr0
echo

sudo apt install -y samba

echo

[[ ! -f /etc/samba/smb.conf ]] || sudo cp -anv /etc/samba/smb.conf /etc/samba/smb.conf.bak
sudo cp "${CURRENT_DIR}/config/"* /etc/samba/
echo
[[ -d "${HOME}/SHARED" ]] || mkdir -p "${HOME}/SHARED"
### Choose easy configuration
sudo cp -fv /etc/samba/smb.conf.easy /etc/samba/smb.conf

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
