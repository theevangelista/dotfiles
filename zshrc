# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/joao/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
export PATH="${PATH}:${HOME}/.local/bin/"
# ZPlug
source $HOME/.config/zplug/config


# Aliases and Helpers
alias vim=nvim
function wallpaper {
	rm ~/.wallpaper && sudo ln -s $1 ~/.wallpaper
	feh --bg-max ~/.wallpaper
	wal -l -i ~/.wallpaper
}

function i3config {
	vim ~/.config/i3/config
}
function pbconfig {
	vim ~/.config/polybar/config
}
if [ -e /home/joao/.nix-profile/etc/profile.d/nix.sh ]; then . /home/joao/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
