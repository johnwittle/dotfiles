#.bashrc
if [[ $- != *i* ]] ; then
	 # Shell is non-interactive.  Be done now!
	 return
fi

# Bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Colors
if [ -f ~/.dir_colors ]; then
	    eval `dircolors ~/.dir_colors`
fi

## Shell varibles
export BROWSER='firefox'
export PAGER=less
export EDITOR=vim
export PATH=$PATH:$HOME/bin:/usr/local/bin
export LESS='-R'
export wpsetters=feh
export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTFILESIZE=1000
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear"
LESSOPEN="|lesspipe.sh %s"; export LESSOPEN

stty -ixon		# disable XON/XOFF flow control (^s/^q) 
complete -cf sudo	# Tab complete for sudo

## shopt options
shopt -s cdspell	# This will correct minor spelling errors in a cd command.
shopt -s histappend	# Append to history rather than overwrite
shopt -s checkwinsize	# Check window after each command
shopt -s dotglob	# files beginning with . to be returned in the results of path-name expansion.

## set options
set -o noclobber 	# prevent overwriting files with cat
set -o ignoreeof	# stops ctrl+d from logging me out
set -o vi		# vi-like keybindings for bash

# Prompt
BGREEN='\[\033[1;32m\]'
GREEN='\[\033[0;32m\]'
BRED='\[\033[1;31m\]'
RED='\[\033[0;31m\]'
BBLUE='\[\033[1;34m\]'
BLUE='\[\033[0;34m\]'
NORMAL='\[\033[00m\]'
#PS1="${BLUE}(${NORMAL}\w${BLUE})\n${NORMAL}\u${BLUE}@\h ${RED}\$ ${NORMAL}"
PS1="${GREEN}\u@\h${BRED} \w${NORMAL}\$  "
# X Terminal titles
#case "$TERM" in
#xterm*|rxvt*)
#	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#	;;
#*)
#	;;
#esac


## Aliases
## 
alias rm='rm -r'
alias cp='cp -Rvv'
alias mv='mv'
##
alias ls='ls -hp --time-style=locale --color'
alias ll='ls -l'
alias lh='ls -lh'
alias la='ls -A'
alias l='ls -CF'
##
alias back='cd $OLDPWD'
alias cd..='cd ..'
alias df='df -h'
alias du='du -h -c'
alias mkdir='mkdir -p -v'
alias ..='cd ..'
alias ~='cd ~'
## Application common flags
alias grep='grep --color=auto'
alias ncmpc='ncmpc -c'
alias daemons='ls /var/run/daemons'
alias ping='ping -c 5'
alias nano='nano -w'
alias more='less'
					  # downloads to the actual filename, as opposed to
					  # http://example.com/page.php?action=download as the filename
##
alias pgrep="pgrep -l"
alias recent="ls -lAt | head"
alias Xdefaults="xrdb -load ~/.Xdefaults"



## Sudo
alias pacman='sudo pacman'
alias update='sudo pacman -Syu'


##functions
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xjf $1		;;
			*.tar.gz)	tar xzf $1		;;
			*.bz2)		bunzip2 $1		;;
			*.rar)		rar x $1		;;
			*.gz)		gunzip $1		;;
			*.tar)		tar xf $1		;;
			*.tbz2)		tar xjf $1		;;
			*.tgz)		tar xzf $1		;;
			*.zip)		unzip $1		;;
			*.Z)		uncompress $1	;;
			*)			echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

grab() {
	sudo chown -R ${USER} ${1:-.}
}

psgrep() {
	if [ ! -z $1 ] ; then
		echo "Grepping for processes matching $1..."
		ps aux | grep $1 | grep -v grep
	else
		echo "!! Need name to grep for"
	fi
}

#backup 
bu () { cp $1 ~/.backup/`basename $1`-`date +%Y%m%d%H%M`.backup ; }
alias vihelp='cat /home/john/passive/bashcheatsheet | less'
echo ALERT - Root Shell Access on: `date` `who`
echo ALERT - Root Shell Access on: `date` `who`
echo ALERT - Root Shell Access on: `date` `who`
echo ALERT - Root Shell Access on: `date` `who`
echo ALERT - Root Shell Access on: `date` `who`
