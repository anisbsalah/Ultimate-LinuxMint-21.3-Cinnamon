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
echo "THEMES"
echo "######################################################################################################"
tput sgr0
echo

sudo apt install -y git

echo
tput setaf 3
echo '============================'
echo '[*] Installing Arc theme...'
echo '============================'
tput sgr0
echo

sudo apt install -y arc-theme

[[ -d "${HOME}/.themes" ]] || mkdir -p "${HOME}/.themes"

cp -rf --no-preserve=ownership /usr/share/themes/Arc-Dark "${HOME}/.themes/"

echo
tput setaf 3
echo '================================'
echo '[*] Installing Dracula theme...'
echo '================================'
tput sgr0
echo

git clone https://github.com/anisbsalah/Dracula-Theme.git /tmp/Dracula-Theme
sudo cp -rf /tmp/Dracula-Theme/Dracula/cursors/Qogir-Dracula-Purple-Cursors /usr/share/icons/
sudo cp -rf /tmp/Dracula-Theme/Dracula/gtk/* /usr/share/themes/
sudo cp -rf /tmp/Dracula-Theme/Dracula/Kvantum/* /usr/share/Kvantum/
sudo cp -rf /tmp/Dracula-Theme/Dracula/wallpapers/* /usr/share/backgrounds/

echo
tput setaf 3
echo '=============================='
echo '[*] Installing Sweet themes...'
echo '=============================='
tput sgr0
echo

git clone https://github.com/anisbsalah/Sweet-Themes.git /tmp/Sweet-Themes
sudo cp -rf /tmp/Sweet-Themes/Sweet/Sweet-cursors/Qogir-Sweet-Blue-Cursors /usr/share/icons/
sudo cp -rf /tmp/Sweet-Themes/Sweet/Sweet-gtk/* /usr/share/themes/
sudo cp -rf /tmp/Sweet-Themes/Sweet/Sweet-Kvantum/* /usr/share/Kvantum/
sudo cp -rf /tmp/Sweet-Themes/Sweet/Sweet-Wallpapers /usr/share/backgrounds/

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Themes have been installed"
echo "######################################################################################################"
tput sgr0
echo
