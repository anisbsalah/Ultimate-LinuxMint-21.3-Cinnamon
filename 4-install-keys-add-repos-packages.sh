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

# See: https://brave.com/linux/
# See: https://www.sublimetext.com/docs/linux_repositories.html
# See: https://software.opensuse.org/download.html?project=home%3Ajustkidding&package=ueberzugpp
# See: https://ulauncher.io/#Download
# See: https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo

#echo
tput setaf 3
echo "######################################################################################################"
echo "################# Adding repositories"
echo "######################################################################################################"
tput sgr0
echo

sudo apt install -y software-properties-common

##################################################################################################################

echo
tput setaf 13
echo '[+] Alacritty repository...'
tput sgr0
echo

sudo add-apt-repository -y ppa:aslatter/ppa

##################################################################################################################

echo
tput setaf 13
echo '[+] Brave Browser repository...'
tput sgr0
echo

tput setaf 12
echo '➜ Getting the key...'
tput sgr0
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo
tput setaf 12
echo '➜ Adding the repo...'
tput sgr0
# echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

##################################################################################################################

echo
tput setaf 13
echo '[+] Sublime Text repository...'
tput sgr0
echo

tput setaf 12
echo '➜ Getting the key...'
tput sgr0
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg >/dev/null

echo
tput setaf 12
echo '➜ Adding the repo...'
tput sgr0
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

##################################################################################################################

echo
tput setaf 13
echo '[+] Ueberzugpp repository...'
tput sgr0
echo

tput setaf 12
echo '➜ Getting the key...'
tput sgr0
curl -fsSL https://download.opensuse.org/repositories/home:justkidding/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_justkidding.gpg >/dev/null

echo
tput setaf 12
echo '➜ Adding the repo...'
tput sgr0
echo 'deb http://download.opensuse.org/repositories/home:/justkidding/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/home:justkidding.list

##################################################################################################################

echo
tput setaf 13
echo '[+] Ulauncher repository...'
tput sgr0
echo

sudo add-apt-repository universe -y && sudo add-apt-repository ppa:agornostal/ulauncher -y

##################################################################################################################

echo
tput setaf 13
echo '[+] VSCodium repository...'
tput sgr0
echo

tput setaf 12
echo '➜ Getting the key...'
tput sgr0
sudo wget https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
	-O /usr/share/keyrings/vscodium-archive-keyring.asc

echo
tput setaf 12
echo '➜ Adding the repo...'
tput sgr0
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.asc ] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs vscodium main' |
	sudo tee /etc/apt/sources.list.d/vscodium.list
