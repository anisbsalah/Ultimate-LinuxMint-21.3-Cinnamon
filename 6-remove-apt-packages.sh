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
tput setaf 9
echo "######################################################################################################"
echo "################# Removing packages..."
echo "######################################################################################################"
tput sgr0
echo

sudo apt purge -y celluloid
sudo apt purge -y hexchat
# sudo apt purge -y libreoffice-*
# sudo apt purge -y papirus-icon-theme
sudo apt purge -y rhythmbox
sudo apt purge -y rhythmbox-data
# sudo apt purge -y transmission-gtk
# sudo apt purge -y transmission-common
sudo apt purge -y warpinator

sudo apt autoremove -y

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Packages removed successfully"
echo "######################################################################################################"
tput sgr0
echo
