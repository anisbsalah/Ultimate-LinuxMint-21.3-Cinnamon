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

# Define fonts array
fonts=("3270" "Agave" "AnonymousPro" "Arimo" "AurulentSansMono" "BigBlueTerminal" "BitstreamVeraSansMono" "CascadiaCode" "CodeNewRoman" "ComicShannsMono" "Cousine" "DaddyTimeMono" "DejaVuSansMono" "DroidSansMono" "EnvyCodeR" "FantasqueSansMono" "FiraCode" "FiraMono" "Go-Mono" "Gohu" "Hack" "Hasklig" "HeavyData" "Hermit" "IBMPlexMono" "Inconsolata" "InconsolataGo" "InconsolataLGC" "IntelOneMono" "Iosevka" "IosevkaTerm" "JetBrainsMono" "Lekton" "LiberationMono" "Lilex" "MPlus" "Meslo" "Monofur" "Monoid" "Mononoki" "NerdFontsSymbolsOnly" "Noto" "OpenDyslexic" "Overpass" "ProFont" "RobotoMono" "ShareTechMono" "SourceCodePro" "SpaceMono" "Terminus" "Tinos" "Ubuntu" "UbuntuMono" "VictorMono")

# Print fonts array in multiple columns
num_columns=5
num_fonts=${#fonts[@]}
num_rows=$(((num_fonts + num_columns - 1) / num_columns))
for ((i = 0; i < num_rows; i++)); do
	for ((j = 0; j < num_columns; j++)); do
		index=$((j * num_rows + i))
		if ((index < num_fonts)); then
			printf "%-2d) %-25s" "$((index + 1))" "${fonts[index]}"
		fi
	done
	echo
done

# Prompt user to select fonts
echo
tput setaf 12
echo "######################################################################################################"
echo " * Choose the nerd fonts you would like to download..."
echo "   (enter numbers separated by spaces)"
echo "######################################################################################################"
tput sgr0

read -erp " " font_nums_str
#read -er font_nums_str

# Convert user input to array of font names
IFS=' ' read -ra font_nums <<<"${font_nums_str}"

# Check if any valid font numbers were selected
invalid_selection=0
selected_fonts=()
for num in "${font_nums[@]}"; do
	if ((num < 1 || num > ${#fonts[@]})); then
		tput setaf 9
		echo "######################################################################################################"
		echo "################# Invalid selection: ${num}"
		echo "######################################################################################################"
		tput sgr0
		invalid_selection=1
	else
		selected_fonts+=("${fonts[num - 1]}")
	fi
done
if ((invalid_selection == 0)); then
	echo
	tput setaf 13
	echo -e "############################\n# Fonts to be downloaded...\n############################\n* ${selected_fonts[0]}"
	for ((i = 1; i < ${#selected_fonts[@]}; i++)); do
		echo "* ${selected_fonts[i]}"
	done
	echo "############################"
	tput sgr0
	echo

	# Install dependencies
	sudo apt install -y fontconfig git

	if [[ ! -d /usr/local/share/fonts/NerdFonts ]]; then
		sudo mkdir -p /usr/local/share/fonts/NerdFonts
	fi

	mkdir -p /tmp/nerd-fonts
	cd /tmp/nerd-fonts || exit 1

	for font in "${selected_fonts[@]}"; do
		tput setaf 3
		echo "######################################################################################################"
		echo "################# Downloading ${font} Nerd Fonts..."
		echo "######################################################################################################"
		tput sgr0

		curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/"${font}".tar.xz

		mkdir -p "${font}"

		tar -xf "${font}".tar.xz -C "${font}"

		rm -rf "${font}".tar.xz

		sudo mv "${font}" /usr/local/share/fonts/NerdFonts/

		echo

	done

	sudo fc-cache -fv

	# Clean up
	cd ..
	rm -rf nerd-fonts

	tput setaf 2
	echo "######################################################################################################"
	echo "################# Installation complete"
	echo "######################################################################################################"
	tput sgr0
fi
