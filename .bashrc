#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1='\[\e[38;5;167m\][\[\e[38;5;221m\]\u\[\e[38;5;113m\]@\[\e[38;5;38m\]\H\[\e[0m\] \[\e[38;5;133m\]\w\[\e[38;5;167m\]]\[\e[38;5;248m\]\\$\[\e[0m\] '

# alias added by zyuke:
alias vi="vim"
alias n="nnn"
alias nv="nvim"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# define nnn color
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
