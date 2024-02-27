# Zsh configuration file
#
# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=50000
SAVEHIST=10000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/anisbsalah/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

### PATH
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.bin" ]; then
    PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/go/bin" ]; then
    PATH="$HOME/go/bin:$PATH"
fi

if [ -d "$HOME/.nix-profile/bin" ]; then
    PATH="$HOME/.nix-profile/bin:$PATH"
fi

### PLUGINS
source $HOME/.config/zsh/clipboard.zsh
source $HOME/.config/zsh/completion.zsh
source $HOME/.config/zsh/functions.zsh
source $HOME/.config/zsh/key-bindings.zsh

if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

source $HOME/.config/zsh/plugins/copyfile/copyfile.plugin.zsh
source $HOME/.config/zsh/plugins/copypath/copypath.plugin.zsh
source $HOME/.config/zsh/plugins/extract/extract.plugin.zsh
source $HOME/.config/zsh/plugins/sudo/sudo.plugin.zsh
source $HOME/.config/zsh/plugins/web-search/web-search.plugin.zsh
source $HOME/.config/zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh

### ALIASES
if [ -f ~/.config/zsh/zsh_aliases ]; then
    . ~/.config/zsh/zsh_aliases
fi

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
}

### ranger-cd
function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
        if [ "$(cat -- "$tempfile")" != "$(echo -n $(pwd))" ]; then
            cd -- "$(cat "$tempfile")"
        fi
    rm -f -- "$tempfile"
}

### ranger-cd will run by alt+r
bindkey -s "^\er" "ranger-cd\n"

### Oh My Posh
#eval "$(oh-my-posh init zsh)"

### Starship
eval "$(starship init zsh)"

### reporting tools - install when not installed
# fetch
# hfetch
# neofetch
pfetch
# screenfetch
# sfetch