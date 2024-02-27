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
echo "PERSONAL SETTINGS"
echo "######################################################################################################"
tput sgr0
echo

tput setaf 13
echo '****************************************'
echo ' * Directories to create'
echo '****************************************'
tput sgr0
#echo

[[ -d /usr/local/share/fonts/IcoMoon-Fonts ]] || sudo mkdir -p /usr/local/share/fonts/IcoMoon-Fonts
[[ -d /usr/share/backgrounds/AbS-Wallpapers ]] || sudo mkdir -p /usr/share/backgrounds/AbS-Wallpapers

[[ -d "${HOME}/.config/alacritty" ]] || mkdir -p "${HOME}/.config/alacritty"
[[ -d "${HOME}/.config/fish" ]] || mkdir -p "${HOME}/.config/fish"
[[ -d "${HOME}/.config/fontconfig" ]] || mkdir -p "${HOME}/.config/fontconfig"
[[ -d "${HOME}/.config/kitty" ]] || mkdir -p "${HOME}/.config/kitty"
[[ -d "${HOME}/.config/Kvantum" ]] || mkdir -p "${HOME}/.config/Kvantum"
[[ -d "${HOME}/.config/lf" ]] || mkdir -p "${HOME}/.config/lf"
[[ -d "${HOME}/.config/pistol" ]] || mkdir -p "${HOME}/.config/pistol"
[[ -d "${HOME}/.config/qt5ct" ]] || mkdir -p "${HOME}/.config/qt5ct"
[[ -d "${HOME}/.config/ranger" ]] || mkdir -p "${HOME}/.config/ranger"
[[ -d "${HOME}/.config/rofi" ]] || mkdir -p "${HOME}/.config/rofi"
[[ -d "${HOME}/.config/sublime-text" ]] || mkdir -p "${HOME}/.config/sublime-text"
[[ -d "${HOME}/.config/Thunar" ]] || mkdir -p "${HOME}/.config/Thunar"
[[ -d "${HOME}/.config/ulauncher/user-themes" ]] || mkdir -p "${HOME}/.config/ulauncher/user-themes"
[[ -d "${HOME}/.config/VSCodium" ]] || mkdir -p "${HOME}/.config/VSCodium"
[[ -d "${HOME}/.config/wezterm" ]] || mkdir -p "${HOME}/.config/wezterm"
[[ -d "${HOME}/.config/xed" ]] || mkdir -p "${HOME}/.config/xed"
[[ -d "${HOME}/.config/yazi" ]] || mkdir -p "${HOME}/.config/yazi"

[[ -d "${HOME}/.local/bin" ]] || mkdir -p "${HOME}/.local/bin"
[[ -d "${HOME}/.local/share/gedit/styles" ]] || mkdir -p "${HOME}/.local/share/gedit/styles"
[[ -d "${HOME}/.local/share/nemo/actions" ]] || mkdir -p "${HOME}/.local/share/nemo/actions"
[[ -d "${HOME}/.local/share/nemo/scripts" ]] || mkdir -p "${HOME}/.local/share/nemo/scripts"

echo
tput setaf 13
echo '****************************************'
echo ' * Dotfiles'
echo '****************************************'
tput sgr0
echo

MONITOR_RESOLUTION=$(xdpyinfo | awk '/dimensions/{print $2}')

cp -rf "${CURRENT_DIR}/Personal/settings/alacritty/"* "${HOME}/.config/alacritty/"
cp -fv "${CURRENT_DIR}/Personal/settings/fontconfig/fonts.conf" "${HOME}/.config/fontconfig/fonts.conf"
cp -rf "${CURRENT_DIR}/Personal/settings/kitty/"* "${HOME}/.config/kitty/"
cp -rf "${CURRENT_DIR}/Personal/settings/lf/"* "${HOME}/.config/lf/"
cp -fv "${CURRENT_DIR}/Personal/settings/qt5ct/qt5ct.conf" "${HOME}/.config/qt5ct/"
cp -fv "${CURRENT_DIR}/Personal/settings/pistol/pistol.conf" "${HOME}/.config/pistol/"
cp -fv "${CURRENT_DIR}/Personal/settings/ranger/"* "${HOME}/.config/ranger/"
cp -rf "${CURRENT_DIR}/Personal/settings/rofi/${MONITOR_RESOLUTION}/"* "${HOME}/.config/rofi/"
cp -rf "${CURRENT_DIR}/Personal/settings/sublime-text/"* "${HOME}/.config/sublime-text/"
cp -fv "${CURRENT_DIR}/Personal/settings/Thunar/"* "${HOME}/.config/Thunar/"
cp -rf "${CURRENT_DIR}/Personal/settings/ulauncher/user-themes/"* "${HOME}/.config/ulauncher/user-themes/"
cp -rf "${CURRENT_DIR}/Personal/settings/VSCodium/User" "${HOME}/.config/VSCodium/"
cp -rf "${CURRENT_DIR}/Personal/settings/wezterm/"* "${HOME}/.config/wezterm/"
cp "${CURRENT_DIR}/Personal/settings/xed/"* "${HOME}/.config/xed/"
cp -v "${CURRENT_DIR}/Personal/settings/yazi/"* "${HOME}/.config/yazi/"

cp -v "${CURRENT_DIR}/Personal/scripts/git-setup" "${HOME}/.local/bin/"
cp -v "${CURRENT_DIR}/Personal/scripts/zenity_askpass.sh" "${HOME}/.local/bin/"
cp "${CURRENT_DIR}/Personal/settings/gedit/"* "${HOME}/.local/share/gedit/styles/"
cp -rf "${CURRENT_DIR}/Personal/settings/nemo/actions/"* "${HOME}/.local/share/nemo/actions/"
cp -rf "${CURRENT_DIR}/Personal/settings/nemo/scripts/"* "${HOME}/.local/share/nemo/scripts/"

echo
tput setaf 13
echo '****************************************'
echo ' * Appearance'
echo '****************************************'
tput sgr0
echo

gsettings set org.cinnamon.desktop.interface cursor-theme 'Qogir-Cursors'
gsettings set org.cinnamon.desktop.interface gtk-theme 'Arc-Dark'
gsettings set org.cinnamon.desktop.interface icon-theme 'Papirus-Dark'
gsettings set org.cinnamon.theme name 'Arc-Dark'

# Kvantum theme
kvantummanager --set KvArcDark
sudo kvantummanager --set KvArcDark

# Environment variables
[[ ! -f /etc/environment ]] || sudo cp -anv /etc/environment /etc/environment.bak
function search_and_replace() {
	local FIND=$1
	local REPLACE=$2

	if grep -q "${FIND}" /etc/environment &>/dev/null; then
		# Replace the existing value of the variable
		sudo sed -i "s/${FIND}.*/${REPLACE}/g" /etc/environment
	else
		# Write a new line with the variable
		echo "${REPLACE}" | sudo tee -a /etc/environment
	fi
}
search_and_replace "GTK_THEME=" "GTK_THEME=Arc-Dark"
#search_and_replace "QT_STYLE_OVERRIDE=" "QT_STYLE_OVERRIDE=kvantum"
search_and_replace "QT_QPA_PLATFORMTHEME=" "QT_QPA_PLATFORMTHEME=qt5ct"
search_and_replace "EDITOR=" "EDITOR=nano"
search_and_replace "VISUAL=" "VISUAL=nano"
#[[ -d "${HOME}/.config/environment.d" ]] || mkdir -p "${HOME}/.config/environment.d"
#echo 'QT_STYLE_OVERRIDE=kvantum' | tee -a "${HOME}/.config/environment.d/qt.conf"

echo
tput setaf 13
echo '****************************************'
echo ' * Backgrounds'
echo '****************************************'
tput sgr0
echo

#sudo wget "https://raw.githubusercontent.com/anisbsalah/Wallpapers/main/AbS-Wallpapers/abs-54.jpg" -O /usr/share/backgrounds/AbS-Wallpapers/desktop_bg.jpg
sudo cp -v "${CURRENT_DIR}/Personal/settings/backgrounds/desktop_bg.jpg" /usr/share/backgrounds/AbS-Wallpapers/
sudo cp -v "${CURRENT_DIR}/Personal/settings/backgrounds/login_bg.jpg" /usr/share/backgrounds/AbS-Wallpapers/

gsettings set org.cinnamon.desktop.background picture-uri 'file:///usr/share/backgrounds/AbS-Wallpapers/desktop_bg.jpg'
gsettings set org.cinnamon.desktop.background picture-options 'stretched'

echo
tput setaf 13
echo '****************************************'
echo ' * Font selection'
echo '****************************************'
tput sgr0
#echo

gsettings set org.cinnamon.desktop.interface font-name 'Noto Sans 11'
gsettings set org.cinnamon.desktop.wm.preferences titlebar-font 'Noto Sans Bold 11'
gsettings set org.nemo.desktop font 'Noto Sans 11'
gsettings set org.gnome.desktop.interface document-font-name 'Noto Sans 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Hack 10'

sudo cp "${CURRENT_DIR}/fonts/Ico"* /usr/local/share/fonts/IcoMoon-Fonts/

echo
tput setaf 13
echo '****************************************'
echo ' * Login window'
echo '****************************************'
tput sgr0
echo

gsettings set x.dm.slick-greeter background '/usr/share/backgrounds/linuxmint/sele_ring_center.jpg'
gsettings set x.dm.slick-greeter background-color '#000000'
gsettings set x.dm.slick-greeter draw-user-backgrounds false
gsettings set x.dm.slick-greeter theme-name 'Arc-Dark'
gsettings set x.dm.slick-greeter icon-theme-name 'Papirus-Dark'
gsettings set x.dm.slick-greeter cursor-theme-name 'Qogir-Cursors'
gsettings set x.dm.slick-greeter font-name 'Noto Sans Bold 11'

sudo cp -fv "${CURRENT_DIR}/Personal/settings/lightdm/"* /etc/lightdm/

echo
tput setaf 13
echo '****************************************'
echo ' * Account details'
echo '****************************************'
tput sgr0
echo

cp -fv "${CURRENT_DIR}/Personal/settings/.face" "${HOME}/"

echo
tput setaf 13
echo '****************************************'
echo ' * Keyboard & touchpad'
echo '****************************************'
tput sgr0
#echo

gsettings set org.cinnamon.desktop.interface keyboard-layout-show-flags false
gsettings set org.cinnamon.desktop.peripherals.touchpad edge-scrolling-enabled true
gsettings set org.cinnamon.desktop.peripherals.touchpad two-finger-scrolling-enabled false
gsettings set org.cinnamon.desktop.peripherals.touchpad natural-scroll false

echo
tput setaf 13
echo '****************************************'
echo ' * Application preferences'
echo '****************************************'
tput sgr0
#echo

### Nemo
gsettings set org.nemo.preferences show-new-folder-icon-toolbar true
gsettings set org.nemo.preferences show-open-in-terminal-toolbar true
#gsettings set org.nemo.preferences.menu-config selection-menu-copy-to true
#gsettings set org.nemo.preferences.menu-config selection-menu-move-to true

### Gedit
gsettings set org.gnome.gedit.plugins active-plugins "['wordcompletion', 'multiedit', 'colorpicker', 'codecomment', 'charmap', 'bracketcompletion', 'spell', 'sort', 'quickopen', 'quickhighlight', 'modelines', 'filebrowser', 'docinfo']"
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor use-default-font false
gsettings set org.gnome.gedit.preferences.editor editor-font 'JetBrainsMono Nerd Font 12'
gsettings set org.gnome.gedit.preferences.editor scheme 'arc-dark'
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
gsettings set org.gnome.gedit.preferences.editor wrap-mode 'none'

### Xedit
gsettings set org.x.editor.plugins active-plugins "['wordcompletion', 'time', 'textsize', 'taglist', 'sort', 'modelines', 'joinlines', 'filebrowser', 'docinfo', 'open-uri-context-menu', 'bracketcompletion']"
gsettings set org.x.editor.preferences.editor bracket-matching true
gsettings set org.x.editor.preferences.editor display-line-numbers true
gsettings set org.x.editor.preferences.editor use-default-font false
gsettings set org.x.editor.preferences.editor editor-font 'JetBrainsMono Nerd Font 12'
gsettings set org.x.editor.preferences.editor scheme 'oblivion'
gsettings set org.x.editor.preferences.editor highlight-current-line true
gsettings set org.x.editor.preferences.editor prefer-dark-theme true

### Gnome-terminal
export TERMINAL=gnome-terminal
./Personal/settings/gnome-terminal/gnome-terminal-themes.sh
#bash Personal/settings/gnome-terminal/gnome-terminal-themes.sh

### VSCodium extensions
tput setaf 3
echo "Installing codium extensions..."
tput sgr0
extensions=(
	"EditorConfig.EditorConfig"
	"esbenp.prettier-vscode"
	"foxundermoon.shell-format"
	"jeff-hykin.better-nix-syntax"
	"JohnnyMorganz.stylua"
	"mkhl.shfmt"
	"ph-hawkins.arc-plus"
	"PKief.material-icon-theme"
	"rogalmic.bash-debug"
	"timonwong.shellcheck"
	"trunk.io"
)
for ext in "${extensions[@]}"; do
	codium --install-extension "${ext}" --force
done

echo
tput setaf 13
echo '****************************************'
echo ' * Default applications'
echo '****************************************'
tput sgr0
#echo

gsettings set org.cinnamon.desktop.default-applications.terminal exec 'alacritty'

echo
tput setaf 13
echo '****************************************'
echo ' * Flatpak permissions'
echo '****************************************'
tput sgr0
#echo

sudo flatpak override --filesystem="${HOME}"/.themes:ro
sudo flatpak override --filesystem=xdg-config/fontconfig:ro
sudo flatpak override --filesystem=xdg-config/gtk-3.0:ro
sudo flatpak override --filesystem=xdg-config/gtk-4.0:ro
sudo flatpak override --filesystem=xdg-config/Kvantum:ro

sudo flatpak override --env=GTK_THEME=Arc-Dark
sudo flatpak override --env=QT_STYLE_OVERRIDE=kvantum

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Done"
echo "######################################################################################################"
tput sgr0
echo
