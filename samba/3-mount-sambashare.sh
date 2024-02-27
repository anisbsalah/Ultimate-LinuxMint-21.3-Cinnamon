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
echo "################# Installing cifs-utils..."
echo "######################################################################################################"
tput sgr0
echo

sudo apt install -y cifs-utils

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Creating the mount point"
echo "######################################################################################################"
tput sgr0

[[ -d "${HOME}/SAMBASHARE" ]] || mkdir -p "${HOME}/SAMBASHARE"

tput setaf 3
echo "######################################################################################################"
echo "################# Creating the samba credentials file"
echo "######################################################################################################"
echo

echo "[#?] Type your Samba username:"
tput sgr0
read -er smb_usr

echo
tput setaf 3

echo "[#?] Type your Samba password:"
tput sgr0
read -er smb_passwd

echo

echo "username=${smb_usr}
password=${smb_passwd}" | tee "${HOME}/.smbcred"

sudo chmod 600 "${HOME}/.smbcred" # so that only the root user can read its contents

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Editing the fstab"
echo "######################################################################################################"
echo

echo "What is the IP address of your Samba server?"
tput sgr0
read -er IP_ADDRESS

echo -e "\n//${IP_ADDRESS}/sambashare	${HOME}/SAMBASHARE	cifs	credentials=${HOME}/.smbcred,noperm	0	0" | sudo tee -a /etc/fstab

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Reloading fstab & Mounting"
echo "######################################################################################################"
tput sgr0
echo

sudo systemctl daemon-reload
sudo mount -av

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Done"
echo "######################################################################################################"
tput sgr0
echo
