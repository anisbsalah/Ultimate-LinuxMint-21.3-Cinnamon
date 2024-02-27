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
echo "################# Installing systemd-swap..."
echo "######################################################################################################"
tput sgr0
echo

sudo apt install -y git

### Debian based distros
git clone https://github.com/Nefelim4ag/systemd-swap.git /tmp/systemd-swap
cd /tmp/systemd-swap || exit 1
make deb
sudo apt install ./systemd-swap_*_all.deb

# ### Manual installation	(seems to fail)
# git clone https://github.com/Nefelim4ag/systemd-swap.git /tmp/systemd-swap
# cd /tmp/systemd-swap || exit 1
# sudo make install

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Editing config file"
echo "######################################################################################################"
tput sgr0
echo

echo "zram_enabled=1
zram_size=3072000000
zram_count=1
zram_streams=1
zram_alg=zstd
zram_prio=32767" | sudo tee -a /etc/systemd/swap.conf

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Enabling & starting service"
echo "######################################################################################################"
tput sgr0
echo

sudo systemctl enable --now systemd-swap

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Confirming that the device has been created and it is in use"
echo "######################################################################################################"
tput sgr0
echo

sleep 5

swapon --show

echo
tput setaf 2
echo "######################################################################################################"
echo "################# systemd-swap has been installed"
echo "######################################################################################################"
tput sgr0
echo
