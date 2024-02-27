# Fish configuration file
#
set fish_greeting             # Supresses fish's intro message

### PATH ###
set -e fish_user_paths
fish_add_path $HOME/bin $HOME/.bin $HOME/.local/bin $HOME/go/bin $HOME/.nix-profile/bin

### ALIASES ###
source ~/.config/fish/fish_aliases

### Oh-my-posh ###
#oh-my-posh init fish | source

### Starship ###
starship init fish | source

### Pfetch ###
pfetch