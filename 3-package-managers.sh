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
echo "PACKAGE MANAGERS"
echo "######################################################################################################"
tput sgr0
echo

tput setaf 3
echo '=========================='
echo '[*] Installing deb-get...'
echo '=========================='
tput sgr0
echo

sudo apt install -y curl lsb-release wget

curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get

echo
tput setaf 2
echo "######################################################################################################"
echo "################# deb-get has been installed"
echo "######################################################################################################"
tput sgr0
echo

tput setaf 3
echo '======================='
echo '[*] Installing Nala...'
echo '======================='
tput sgr0
echo

sudo apt install -y nala

echo
tput setaf 13
echo '➜ Converting APT to Nala...'
tput sgr0
echo

### Backup .bashrc file
[[ ! -f "${HOME}/.bashrc" ]] || cp -anv "${HOME}/.bashrc" "${HOME}/.bashrc.bak"

echo '
### Convert APT to Nala
apt() {
	command nala "$@"
}
sudo() {
	if [ "$1" = "apt" ]; then
		shift
		command sudo nala "$@"
	else
		command sudo "$@"
	fi
}' | tee -a "${HOME}/.bashrc"

echo '
### Convert APT to Nala
apt() {
	command nala "$@"
}
sudo() {
	if [ "$1" = "apt" ]; then
		shift
		command sudo nala "$@"
	else
		command sudo "$@"
	fi
}' | sudo tee -a /root/.bashrc

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Nala has been installed"
echo "######################################################################################################"
tput sgr0
echo

tput setaf 3
echo '==========================='
echo '[*] Installing Pacstall...'
echo '==========================='
tput sgr0
echo

sudo apt install -y curl wget

sudo bash -c "$(curl -fsSL https://pacstall.dev/q/install || wget -q https://pacstall.dev/q/install -O -)"

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Pacstall has been installed"
echo "######################################################################################################"
tput sgr0
echo
