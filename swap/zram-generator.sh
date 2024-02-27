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
echo "################# Installing zram-generator..."
echo "######################################################################################################"
tput sgr0
echo

# sudo apt install -y systemd-zram-generator # Cannot change disksize for initialized device with this installation

### Manual installation
sudo apt install -y git cargo ronn
git clone https://github.com/systemd/zram-generator.git /tmp/zram-generator
cd /tmp/zram-generator || exit 1
make build && sudo make install NOBUILD=true

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Creating config file"
echo "######################################################################################################"
tput sgr0
echo

cat <<EOF | sudo tee /etc/systemd/zram-generator.conf
[zram0]
zram-size = min(min(ram, 4096) + max(ram - 4096, 0) / 2, 32 * 1024)
compression-algorithm = zstd
swap-priority = 100
EOF

#echo '[zram0]
#zram-size = ram / 2
#compression-algorithm = zstd
#swap-priority = 100' | sudo tee /etc/systemd/zram-generator.conf

#echo '[zram0]
#zram-size = 3072
#compression-algorithm = zstd
#swap-priority = 100' | sudo tee /etc/systemd/zram-generator.conf

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Creating new device units"
echo "######################################################################################################"
tput sgr0

sudo systemctl daemon-reload

sudo systemctl start /dev/zram0

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
echo "################# zram-generator has been installed"
echo "######################################################################################################"
tput sgr0
echo
