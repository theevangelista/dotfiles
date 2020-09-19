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
# End of lines added by compinstall
export NOTES_DIR=${HOME}/oghma
export PATH="${PATH}:${HOME}/.local/bin/"
export ANDROID_HOME="${HOME}/Android/Sdk"
export ANDROID_SDK_ROOT="${HOME}/Android/Sdk"
export JAVA_HOME="${HOME}/.jdks/azul-1.8.0_265"
export FREETYPE_PROPERTIES="truetype:interpreter-version=38"
export PURE_CMD_MAX_EXEC_TIME=99999999999999
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export EDITOR=idea
# ZPlug
source $HOME/.config/zplug/config
# asdf
#. $HOME/.asdf/asdf.sh
# rust

# Aliases and Helpers
alias vim=nvim
alias perm=chmod +x
alias kakrc=kak ~/.config/kak/kakrc
alias e=${EDITOR}
alias open=xdg-open
alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls -A --color=auto'
alias c=clear
alias mkdir='mkdir -pv'
# dont fuckup
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -I --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
# Git Aliases
alias gpo=git push origin master
alias gs=git status
alias gm=git commit
alias ga=git add
# Sys
## pass options to free ##
alias meminfo='free -m -l -t'
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
# temperature
alias temp='sensors | grep "Package id 0"'
alias tk='./bin/task'



# Functions
function sauce {
	source $HOME/.zshrc
}
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
function montemp {
	while true; do
		cmd=$(ps -Ao comm,pcpu --sort=-pcpu | tail -n +2 | head -n 1 | awk '{print $1 "," $2}')
		d=$(date +"%d/%m/%Y %H:%M")
		t=$(sensors | grep "Package id 0" | grep -oE '\s{2}\+([0-9.]*)' | sed 's/\s*+\s*//')
		echo "$d,$t,$cmd"
		sleep 60
	done
}

function kittyconfig {
	vim ~/.config/kitty/kitty.conf
}

function kakconfig {
	kak ~/.config/kak/kakrc
}

function logtemp {
	log=$HOME/temp.log
	if [ ! -f "$log" ]; then touch $log; fi
	(montemp >> "$log" &) && \
	echo 'Logging started'
}

function note {
	if [ -z "$1" ]; then
		vim $HOME/.notes
	else
		echo -n $(date +"%d/%m/%Y %H:%M") $1 >> $HOME/.notes
	fi
}

function projects {
	file=$(fd . ~/Projects/ --type directory --maxdepth=1 | fzf -q "$1")
	cd "$file"
}

function in-task {
	curl -sL https://taskfile.dev/install.sh | sh
	touch ./Taskfile.yml
}
function twt {
	streamlink twitch.tv/$1 best > /dev/null &
}
function take-note {
	e ${NOTES_DIR}
}
function bk-notes {
	cd ${NOTES_DIR}
	git add --all
	git commit -am "(bkp) safety backup"
	git push origin master
}
#Nix Pkgs
if [ -e /home/joao/.nix-profile/etc/profile.d/nix.sh ]; then . /home/joao/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
eval "$(starship init zsh)"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit
compinit



if [ -e /home/sleepiejohn/.nix-profile/etc/profile.d/nix.sh ]; then . /home/sleepiejohn/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
