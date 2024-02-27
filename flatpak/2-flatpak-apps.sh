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
echo "################# Installing flatpak applications..."
echo "######################################################################################################"
tput sgr0
echo

flatpak install -y flathub com.github.tchx84.Flatseal

flatpak install -y runtime/org.kde.KStyle.Kvantum/x86_64/5.15 runtime/org.kde.KStyle.Kvantum/x86_64/5.15-21.08 runtime/org.kde.KStyle.Kvantum/x86_64/5.15-22.08 runtime/org.kde.KStyle.Kvantum/x86_64/5.15-23.08 runtime/org.kde.KStyle.Kvantum/x86_64/6.5 runtime/org.kde.KStyle.Kvantum/x86_64/6.6

flatpak install -y org.gtk.Gtk3theme.Arc-Dark

flatpak install -y flathub com.bitwarden.desktop

flatpak install -y flathub com.usebottles.bottles

flatpak install -y flathub org.gnome.FontManager

# flatpak install -y flathub org.libreoffice.LibreOffice

flatpak install -y flathub org.kde.okular

flatpak install -y flathub org.telegram.desktop

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Installation complete"
echo "######################################################################################################"
tput sgr0
echo
