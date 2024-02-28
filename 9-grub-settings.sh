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
echo "GRUB SETTINGS"
echo "######################################################################################################"
tput sgr0

tput setaf 3
echo "######################################################################################################"
echo "################# Editing grub file"
echo "######################################################################################################"
tput sgr0
echo

### Backup grub config
[[ ! -f /etc/default/grub ]] || sudo cp -anv /etc/default/grub /etc/default/grub.bak

### Grub timeout
sudo sed -i 's/GRUB_TIMEOUT_STYLE=hidden/GRUB_TIMEOUT_STYLE=menu/' /etc/default/grub
sudo sed -i 's/GRUB_TIMEOUT=0/GRUB_TIMEOUT=5/' /etc/default/grub

### Resolution
#MONITOR_RESOLUTION=$(xdpyinfo | grep -oP 'dimensions:\s+\K\S+')
#MONITOR_RESOLUTION=$(xdpyinfo | awk '/dimensions/{print $2}')
#sudo sed -i "s/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=${MONITOR_RESOLUTION}/" /etc/default/grub
#sudo sed -i 's/#GRUB_GFXMODE=640x480/GRUB_GFXMODE='${MONITOR_RESOLUTION}'/' /etc/default/grub

### Grub background
# grep "GRUB_THEME=" /etc/default/grub >/dev/null 2>&1 && sudo sed -i '/GRUB_THEME=/d' /etc/default/grub
# grep "GRUB_BACKGROUND=" /etc/default/grub >/dev/null 2>&1 && sudo sed -i '/GRUB_BACKGROUND=/d' /etc/default/grub
# sudo cp -fv "${CURRENT_DIR}/Personal/settings/backgrounds/grub_bg.jpg" /boot/grub/grub_bg.jpg
# echo 'GRUB_BACKGROUND=/boot/grub/grub_bg.jpg' | sudo tee -a /etc/default/grub
# echo
# sudo grub-mkconfig -o /boot/grub/grub.cfg

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Installing poly-dark grub theme..."
echo "######################################################################################################"
tput sgr0
echo

wget -P /tmp https://github.com/anisbsalah/poly-dark/raw/main/install.sh
bash /tmp/install.sh --lang English

# grep "GRUB_THEME=" /etc/default/grub >/dev/null 2>&1 && sudo sed -i '/GRUB_THEME=/d' /etc/default/grub
# grep "GRUB_BACKGROUND=" /etc/default/grub >/dev/null 2>&1 && sudo sed -i '/GRUB_BACKGROUND=/d' /etc/default/grub
# echo 'GRUB_BACKGROUND=/boot/grub/themes/poly-dark/background.png' | sudo tee -a /etc/default/grub
# echo 'GRUB_THEME=/boot/grub/themes/poly-dark/theme.txt' | sudo tee -a /etc/default/grub
# sudo grub-mkconfig -o /boot/grub/grub.cfg

# echo
# tput setaf 3
# echo "######################################################################################################"
# echo "################# Installing grub2-mint-theme..."
# echo "######################################################################################################"
# tput sgr0
# echo
#
# grep "GRUB_THEME=" /etc/default/grub >/dev/null 2>&1 && sudo sed -i '/GRUB_THEME=/d' /etc/default/grub
# grep "GRUB_BACKGROUND=" /etc/default/grub >/dev/null 2>&1 && sudo sed -i '/GRUB_BACKGROUND=/d' /etc/default/grub
# sudo apt install --reinstall -o Dpkg::Options::="--force-confmiss" grub2-theme-mint -y
# sudo grub-mkconfig -o /boot/grub/grub.cfg

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Done"
echo "######################################################################################################"
tput sgr0
echo
