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
CURRENT_DIR="$(pwd)"
##################################################################################################################

echo
tput setaf 6
echo "######################################################################################################"
echo "GITHUB PROJECTS"
echo "######################################################################################################"
tput sgr0
echo

sudo apt install -y git make

echo
tput setaf 3
echo '==================================='
echo '[*] Installing dmenu-flexipatch...'
echo '==================================='
tput sgr0
echo

git clone https://github.com/anisbsalah/dmenu-flexipatch.git "${HOME}/.config/dmenu-flexipatch"
cd "${HOME}/.config/dmenu-flexipatch" || exit 1
sudo make install

echo
tput setaf 3
echo '=============================='
echo '[*] Installing dmenu-emoji...'
echo '=============================='
tput sgr0
echo

sudo apt install -y xclip
git clone https://github.com/shasherazi/dmenu-emoji.git /tmp/dmenu-emoji
chmod +x /tmp/dmenu-emoji/dmenu-emoji
sudo cp -v /tmp/dmenu-emoji/dmenu-emoji /usr/local/bin/
sudo cp -v "${CURRENT_DIR}/Personal/scripts/emoji/"{d,r}emoji /usr/local/bin/

echo
tput setaf 13
echo "######################################################################################################"
echo "To select an emoji and copy it to the clipboard use rofi or dmenu. For that we created a script for"
echo "each command: demoji and remoji. It should be located in /usr/local/bin or ~/.local/share/bin"
echo "Now you can bind a keyboard shortcut to launch it."
echo "######################################################################################################"
tput sgr0

echo
tput setaf 3
echo '========================='
echo '[*] Installing bemoji...'
echo '========================='
tput sgr0
echo

sudo apt install -y xclip xdotool
git clone https://github.com/marty-oehme/bemoji.git /tmp/bemoji
chmod +x /tmp/bemoji/bemoji
sudo cp -v /tmp/bemoji/bemoji /usr/local/bin/bemoji

echo
tput setaf 13
echo "######################################################################################################"
echo "Simply execute bemoji without any options to set up the default emoji database and let you quickly"
echo "pick an emoji."
echo "######################################################################################################"
tput sgr0

# ----------------------------------------------------------------------------------------------------

echo
tput setaf 3
echo '==================================================='
echo '[*] Installing lf filemanager & preview scripts...'
echo '==================================================='
tput sgr0
echo

# lf preview prerequisites ----------------------------------------
sudo apt install -y asciidoctor atool catdoc chafa djvulibre-desktop docx2txt epub-utils ffmpeg ffmpegthumbnailer fluidsynth fzf ghostscript gnumeric graphicsmagick imagemagick libmagic-dev lynx mcomix mpv pandoc poppler-utils source-highlight sxiv trash-cli unoconv xdotool wkhtmltopdf

# go (building dependency) ----------------------------------------
mkdir -p /tmp/go
curl -L https://go.dev/dl/go1.22.0.linux-amd64.tar.gz -o /tmp/go/go1.22.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf /tmp/go/go1.22.0.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Installing lf ----------------------------------------------------
env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest
sudo cp -v "${HOME}/go/bin/lf" /usr/local/bin/

# Configuration files ----------------------------------------------
mkdir -p "${HOME}/.config/lf"
cp -v "${CURRENT_DIR}/Personal/settings/lf/"{colors,icons} "${HOME}/.config/lf/"
cp -v "${CURRENT_DIR}/Personal/settings/lf/lf-ueberzug/lfrc" "${HOME}/.config/lf/"                           # this config works with ueberzug
cp -v "${CURRENT_DIR}/Personal/settings/lf/lf-kitty/"{lf_kitty_clean,lf_kitty_preview} "${HOME}/.config/lf/" # this config works with kitty

# Previews ---------------------------------------------------------

# Important: "bat" is used in the preview scripts.
# Please note that in some distro versions the executable
# may be installed as batcat instead of bat (due to a name clash with another package).
# You can set up a bat -> batcat symlink or alias to prevent any issues
# that may come up because of this and to be consistent with other distributions:
# ln -s /usr/bin/batcat ~/.local/bin/bat
sudo cp /usr/bin/batcat /usr/bin/bat

### pistol ( works with kitty and kitty-pistol-previewer )
echo
go install github.com/doronbehar/pistol/cmd/pistol@latest
sudo cp -v "${HOME}/go/bin/pistol" /usr/local/bin/
### kitty-pistol-previewer ( works with kitty and pistol )
echo
git clone https://github.com/duganchen/kitty-pistol-previewer.git /tmp/kitty-pistol-previewer
sudo cp -v /tmp/kitty-pistol-previewer/{kitty_vidthumb,vidthumb} /usr/local/bin/

### neeshy/lfimg preview scripts ( wroks with ueberzug )
echo
git clone https://github.com/neeshy/lfimg.git /tmp/lfimg-neeshy
sudo cp -v /tmp/lfimg-neeshy/lfimg /usr/local/bin/
sudo cp -v "${CURRENT_DIR}/Personal/scripts/lf-ueberzug/lfimg/open" /usr/local/bin/ # this is not the original file from the repo; I have changed some opener applications
cp -v /tmp/lfimg-neeshy/cls "${HOME}/.config/lf/cleaner"
cp -v /tmp/lfimg-neeshy/pv "${HOME}/.config/lf/preview"
cp -v "${CURRENT_DIR}/Personal/settings/lf/lf-ueberzug/lfimg/preview" "${HOME}/.config/lf/preview" # this version of preview uses bat with colors instead of cat

# ### thimc/lfimg (lfrun) preview scripts ( wroks with ueberzug )
# echo
# git clone https://github.com/thimc/lfimg.git /tmp/lfimg-thimc
# cd /tmp/lfimg-thimc || exit 1
# make install

# ### jstkdng/ueberzugpp preview scripts ( wroks with ueberzug )
# echo
# git clone https://github.com/jstkdng/ueberzugpp.git /tmp/ueberzugpp
# sudo cp -v /tmp/ueberzugpp/scripts/lf/lfub /usr/local/bin/
# cp -v /tmp/ueberzugpp/scripts/lf/{cleaner,preview} "${HOME}/.config/lf/"

### sdushantha/fontpreview
echo
git clone https://github.com/sdushantha/fontpreview /tmp/fontpreview
cd /tmp/fontpreview || exit 1
sudo make install

# ----------------------------------------------------------------------------------------------------

echo
tput setaf 3
echo '=================================='
echo '[*] Installing ranger_devicons...'
echo '=================================='
tput sgr0
echo

git clone https://github.com/alexanderjeurissen/ranger_devicons "${HOME}/.config/ranger/plugins/ranger_devicons"

# ----------------------------------------------------------------------------------------------------

echo
tput setaf 3
echo '==================================='
echo '[*] Installing yazi filemanager...'
echo '==================================='
tput sgr0
echo

# Setup the latest stable Rust toolchain
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sleep 1
source "${HOME}/.cargo/env"

# Install the latest git version
cargo install --locked --git https://github.com/sxyazi/yazi.git

# Install prerequisites
sudo apt install -y file ffmpegthumbnailer unar jq poppler-utils fd-find ripgrep fzf zoxide

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Installation complete"
echo "######################################################################################################"
tput sgr0
echo
