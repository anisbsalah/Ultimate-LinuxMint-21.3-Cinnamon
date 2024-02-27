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
echo "################# Updating repositories..."
echo "######################################################################################################"
tput sgr0
echo

sudo apt-get update

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Installing packages..."
echo "######################################################################################################"
tput sgr0
echo

tput setaf 3
echo '============================'
echo '[*] Installing Alacritty...'
echo '============================'
tput sgr0
echo

sudo apt install -y alacritty

echo
tput setaf 3
echo '================================'
echo '[*] Installing Brave Browser...'
echo '================================'
tput sgr0
echo

sudo apt install -y brave-browser

# echo
# tput setaf 3
# echo '========================'
# echo '[*] Installing Bulky...'
# echo '========================'
# tput sgr0
# echo
#
# mkdir -p /tmp/bulky
# curl -L https://github.com/linuxmint/bulky/releases/download/master.mint21/packages.tar.gz -o /tmp/bulky/bulky.tar.gz
# tar -xzf /tmp/bulky/bulky.tar.gz -C /tmp/bulky/
# sudo apt install --allow-downgrades -y /tmp/bulky/packages/* #sudo dpkg -i /tmp/bulky/packages/*

echo
tput setaf 3
echo '=========================='
echo '[*] Installing Catfish...'
echo '=========================='
tput sgr0
echo

sudo apt install -y catfish

echo
tput setaf 3
echo '============================'
echo '[*] Installing Dconf-cli...'
echo '============================'
tput sgr0
echo

sudo apt install -y dconf-cli uuid-runtime

echo
tput setaf 3
echo '==========================='
echo '[*] Installing Deja Dup...'
echo '==========================='
tput sgr0
echo

sudo apt install -y deja-dup

echo
tput setaf 3
echo '====================================='
echo '[*] Installing dmenu dependencies...'
echo '====================================='
tput sgr0
echo

sudo apt install -y build-essential libc6 libcap2-bin libfontconfig1 libfontconfig1-dev libpam0g libx11-6 libx11-dev libxft2 libxft-dev libxinerama1 libxinerama-dev libxrandr2 libxss1 libimlib2-dev libfreetype6-dev

echo
tput setaf 3
echo '========================='
echo '[*] Installing Evince...'
echo '========================='
tput sgr0
echo

sudo apt install -y evince

echo
tput setaf 3
echo '======================'
echo '[*] Installing Exa...'
echo '======================'
tput sgr0
echo

sudo apt install -y exa

echo
tput setaf 3
echo '========================'
echo '[*] Installing fonts...'
echo '========================'
tput sgr0
echo

sudo apt install -y fonts-emojione
sudo apt install -y fonts-font-awesome
sudo apt install -y fonts-hack-ttf
sudo apt install -y fonts-noto fonts-noto-mono fonts-noto-core fonts-noto-ui-core fonts-noto-extra fonts-noto-ui-extra fonts-noto-color-emoji
sudo apt install -y fonts-symbola
sudo apt install -y ttf-ancient-fonts-symbola

# Microsoft fonts
sudo apt install -y ttf-mscorefonts-installer fonts-crosextra-caladea fonts-crosextra-carlito

echo
tput setaf 3
echo '========================'
echo '[*] Installing Gedit...'
echo '========================'
tput sgr0
echo

sudo apt install -y gedit gedit-plugins

echo
tput setaf 3
echo '=============================='
echo '[*] Installing ImageMagick...'
echo '=============================='
tput sgr0
echo

sudo apt install -y imagemagick

echo
tput setaf 3
echo '============================'
echo '[*] Installing Keepassxc...'
echo '============================'
tput sgr0
echo

sudo apt install -y keepassxc

echo
tput setaf 3
echo '========================'
echo '[*] Installing Kitty...'
echo '========================'
tput sgr0
echo

sudo apt install -y kitty

echo
tput setaf 3
echo '=========================='
echo '[*] Installing Kvantum...'
echo '=========================='
tput sgr0
echo

sudo apt install -y qt5-style-kvantum qt5-style-kvantum-themes

echo
tput setaf 3
echo '================================='
echo '[*] Installing language packs...'
echo '================================='
tput sgr0
echo

sudo apt install -y openoffice.org-hyphenation

echo
tput setaf 3
echo '======================='
echo '[*] Installing Meld...'
echo '======================='
tput sgr0
echo

sudo apt install -y meld

echo
tput setaf 3
echo '================================='
echo '[*] Installing Openssh-server...'
echo '================================='
tput sgr0
echo

sudo apt install -y openssh-server
sudo systemctl enable ssh.socket

echo
tput setaf 3
echo '=========================='
echo '[*] Installing Preload...'
echo '=========================='
tput sgr0
echo

sudo apt install -y preload

echo
tput setaf 3
echo '====================================='
echo '[*] Installing PDF printer driver...'
echo '====================================='
tput sgr0
echo

sudo apt install -y printer-driver-cups-pdf

echo
tput setaf 3
echo '=============================='
echo '[*] Installing QBittorrent...'
echo '=============================='
tput sgr0
echo

sudo apt install -y qbittorrent

echo
tput setaf 3
echo '========================='
echo '[*] Installing Ranger...'
echo '========================='
tput sgr0
echo

sudo apt install -y ranger

# ranger preview prerequisites
sudo apt install -y atool bat caca-utils elinks epub-utils exiftool ffmpeg ffmpegthumbnailer highlight imagemagick jq jupyter lynx mediainfo mupdf odt2txt openscad python3-chardet rar sed sqlite3 tar transmission unrar unzip w3m w3m-img

echo
tput setaf 3
echo '======================='
echo '[*] Installing Rofi...'
echo '======================='
tput sgr0
echo

sudo apt install -y rofi

echo
tput setaf 3
echo '==============================='
echo '[*] Installing Sublime Text...'
echo '==============================='
tput sgr0
echo

sudo apt install -y sublime-text

echo
tput setaf 3
echo '========================='
echo '[*] Installing Thunar...'
echo '========================='
tput sgr0
echo

sudo apt install -y thunar thunar-archive-plugin

echo
tput setaf 3
echo '======================'
echo '[*] Installing TLP...'
echo '======================'
tput sgr0
echo

sudo apt install -y tlp

echo
tput setaf 3
echo '============================='
echo '[*] Installing Ueberzugpp...'
echo '============================='
tput sgr0
echo

sudo apt install -y ueberzugpp

echo
tput setaf 3
echo '============================'
echo '[*] Installing Ulauncher...'
echo '============================'
tput sgr0
echo

sudo apt install -y ulauncher

echo
tput setaf 3
echo '======================'
echo '[*] Installing Vim...'
echo '======================'
tput sgr0
echo

sudo apt install -y vim-nox

echo
tput setaf 3
echo '======================'
echo '[*] Installing VLC...'
echo '======================'
tput sgr0
echo

sudo apt install -y vlc

echo
tput setaf 3
echo '==========================='
echo '[*] Installing VSCodium...'
echo '==========================='
tput sgr0
echo

# wget https://github.com/VSCodium/vscodium/releases/download/1.82.2.23257/codium_1.82.2.23257_amd64.deb -O /tmp/codium_1.82.2.23257_amd64.deb
# sudo apt install -y /tmp/codium_1.82.2.23257_amd64.deb

sudo apt install -y codium
# sudo apt install -y codium-insiders

echo
tput setaf 3
echo '=========================='
echo '[*] Installing Wezterm...'
echo '=========================='
tput sgr0
echo

DISTRIB_RELEASE="22.04"
release="20240128-202157-1e552d76"
latest_release=$(curl -s https://api.github.com/repos/wez/wezterm/releases/latest | grep tag_name | cut -d '"' -f 4)
release=${latest_release:-${release}}

wget "https://github.com/wez/wezterm/releases/download/${release}/wezterm-${release}.Ubuntu${DISTRIB_RELEASE}.deb" -O "/tmp/wezterm-${release}.Ubuntu${DISTRIB_RELEASE}.deb"
sudo apt install -y "/tmp/wezterm-${release}.Ubuntu${DISTRIB_RELEASE}.deb"
#sudo dpkg -i "/tmp/wezterm-${release}.Ubuntu${DISTRIB_RELEASE}.deb"

echo
tput setaf 3
echo '========================'
echo '[*] Installing utils...'
echo '========================'
tput sgr0
echo

sudo apt install -y curl debhelper git libnotify-bin lolcat make python3-pip ripgrep rsync shellcheck shfmt wget wmctrl xclip xdotool yad zenity

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Installation complete"
echo "######################################################################################################"
tput sgr0
echo
