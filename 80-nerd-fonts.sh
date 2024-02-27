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

# Download Nerd Fonts on Linux Mint

echo
tput setaf 6
echo "######################################################################################################"
echo "NERD FONTS"
echo "######################################################################################################"
tput sgr0

if [[ ! -d /usr/local/share/fonts/NerdFonts ]]; then
	sudo mkdir -p /usr/local/share/fonts/NerdFonts
fi

mkdir -p /tmp/nerd-fonts
cd /tmp/nerd-fonts || exit 1

# Define fonts array
fonts=("FantasqueSansMono" "Iosevka" "JetBrainsMono" "Mononoki" "NerdFontsSymbolsOnly")

# Loop through the fonts array and download each one
for font in "${fonts[@]}"; do

	tput setaf 3
	echo "######################################################################################################"
	echo "################# Downloading ${font} Nerd Fonts..."
	echo "######################################################################################################"
	tput sgr0
	echo

	curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/"${font}".tar.xz

	mkdir -p "${font}"

	tar -xf "${font}".tar.xz -C "${font}"

	rm -rf "${font}".tar.xz

	sudo mv "${font}" /usr/local/share/fonts/NerdFonts/

	echo

done

sudo fc-cache -fv

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Installation complete"
echo "######################################################################################################"
tput sgr0
echo
