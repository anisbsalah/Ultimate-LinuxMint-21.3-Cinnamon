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
echo "SHELLS"
echo "######################################################################################################"
tput sgr0

tput setaf 3
echo "######################################################################################################"
echo "################# Bash shell..."
echo "######################################################################################################"
tput sgr0
echo

cp -fv "${CURRENT_DIR}/Personal/settings/bash/.bash_aliases" "${HOME}/"

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Installing Fish shell..."
echo "######################################################################################################"
tput sgr0
echo

sudo apt install -y fish
# sudo chsh -s /usr/bin/fish "${USER}"
[[ -d "${HOME}/.config/fish" ]] || mkdir -p "${HOME}/.config/fish"
cp -rf "${CURRENT_DIR}/Personal/settings/fish/"* "${HOME}/.config/fish/"

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Fish shell has been installed"
echo "######################################################################################################"
tput sgr0
echo

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Installing Zsh..."
echo "######################################################################################################"
tput sgr0
echo

sudo apt install -y zsh
sudo apt install -y zsh-autosuggestions zsh-syntax-highlighting

printf '\n[*] Making Zsh your default shell...\n\n'
sudo chsh -s "$(command -v zsh)" "${USER}"
#sudo chsh -s "$(which zsh)" "${USER}"

if ! grep -q 'ZDOTDIR=' /etc/zsh/zshenv &>/dev/null; then
	printf '\n[*] Setting $ZDOTDIR...\n'
	echo '
export ZDOTDIR=${HOME}/.config/zsh' | sudo tee -a /etc/zsh/zshenv
fi

### Converting APT to Nala
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
}' | sudo tee -a /etc/zsh/zshrc

echo
tput setaf 3
echo '============================'
echo '[*] Installing Oh My Zsh...'
echo '============================'
tput sgr0
echo

sudo apt install -y curl git
[[ ! -f "${HOME}/.config/zsh/.zshrc" ]] || cp -anv "${HOME}/.config/zsh/.zshrc" "${HOME}/.config/zsh/.zshrc.bak"
ZSH="${HOME}/.config/oh-my-zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

[[ ! -f "${HOME}/.shell.pre-oh-my-zsh" ]] || rm "${HOME}/.shell.pre-oh-my-zsh"
[[ ! -f "${HOME}/.zshrc" ]] || rm "${HOME}/.zshrc"
[[ ! -f "${HOME}/.zsh_history" ]] || rm "${HOME}/.zsh_history"

### Adding plugins for Zsh
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.config/oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.config/oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/Pilaton/OhMyZsh-full-autoupdate.git ${ZSH_CUSTOM:-~/.config/oh-my-zsh/custom}/plugins/ohmyzsh-full-autoupdate

### Configuration ###
printf '\n[*] Copying dotfiles...\n\n'
### If using Oh My Zsh use this config
[[ -d "${HOME}/.config/zsh" ]] || mkdir -p "${HOME}/.config/zsh"
cp -fv "${CURRENT_DIR}/Personal/settings/oh-my-zsh/.zshrc"* "${HOME}/.config/zsh/"
cp -fv "${CURRENT_DIR}/Personal/settings/oh-my-zsh/zsh_aliases" "${HOME}/.config/zsh/"
sed -i 's|HISTFILE=.*|HISTFILE="$HOME/.config/zsh/.zsh_history"|' "${HOME}/.config/oh-my-zsh/lib/history.zsh"

### If not using Oh My Zsh use this config
# [[ -d "${HOME}/.config/zsh" ]] || mkdir -p "${HOME}/.config/zsh"
# cp -rf "${CURRENT_DIR}/Personal/settings/zsh/"* "${HOME}/.config/zsh/"
# cp -fv "${CURRENT_DIR}/Personal/settings/zsh/.zshrc"* "${HOME}/.config/zsh/"

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Zsh has been installed"
echo "######################################################################################################"
tput sgr0
echo
