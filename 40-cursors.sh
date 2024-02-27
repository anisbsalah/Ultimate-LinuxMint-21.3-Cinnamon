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
echo "CURSORS"
echo "######################################################################################################"
tput sgr0
echo

sudo apt install -y git

echo
tput setaf 3
echo '================================='
echo '[*] Installing Bibata cursors...'
echo '================================='
tput sgr0
echo

sudo apt install -y bibata-cursor-theme
#git clone https://github.com/anisbsalah/Bibata-Cursors.git /tmp/Bibata-Cursors
#sudo cp -rf /tmp/Bibata-Cursors/usr/share/icons/* /usr/share/icons/

#default=Bibata-Modern-Ice
#sudo find /usr/share/icons/default/ -name "index.theme" -exec sed -i "s/Name=.*/Name=${default}/g" {} \;
#sudo find /usr/share/icons/default/ -name "index.theme" -exec sed -i "s/Inherits=.*/Inherits=${default}/g" {} \;

echo
tput setaf 3
echo '====================================='
echo '[*] Installing Catppuccin cursors...'
echo '====================================='
tput sgr0
echo

git clone https://github.com/anisbsalah/Catppuccin-Cursors.git /tmp/Catppuccin-Cursors
sudo cp -rf /tmp/Catppuccin-Cursors/usr/share/icons/Catppuccin-Latte-Light-Cursors /usr/share/icons/

#default=Catppuccin-Latte-Light-Cursors
#sudo find /usr/share/icons/default/ -name "index.theme" -exec sed -i "s/Name=.*/Name=${default}/g" {} \;
#sudo find /usr/share/icons/default/ -name "index.theme" -exec sed -i "s/Inherits=.*/Inherits=${default}/g" {} \;

echo
tput setaf 3
echo '================================'
echo '[*] Installing Qogir cursors...'
echo '================================'
tput sgr0
echo

git clone https://github.com/anisbsalah/Qogir-Cursors.git /tmp/Qogir-Cursors
sudo cp -rf /tmp/Qogir-Cursors/usr/share/icons/Qogir-Cursors /usr/share/icons/

default=Qogir-Cursors
sudo find /usr/share/icons/default/ -name "index.theme" -exec sed -i "s/Name=.*/Name=${default}/g" {} \;
sudo find /usr/share/icons/default/ -name "index.theme" -exec sed -i "s/Inherits=.*/Inherits=${default}/g" {} \;

#echo
#tput setaf 3
#echo '================================='
#echo '[*] Installing Simp1e cursors...'
#echo '================================='
#tput sgr0
#echo
#
#git clone https://github.com/anisbsalah/Simp1e-Cursors.git /tmp/Simp1e-Cursors
#sudo cp -rf /tmp/Simp1e-Cursors/usr/share/icons/* /usr/share/icons/

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Cursors have been installed"
echo "######################################################################################################"
tput sgr0
echo
