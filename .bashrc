#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

export PATH="/home/zyuke/.local/bin:$PATH"

# define prompt style
PS1='\[\e[38;5;167m\][\[\e[38;5;221m\]\u\[\e[38;5;113m\]@\[\e[38;5;38m\]\H\[\e[0m\] \[\e[38;5;133m\]\w\[\e[38;5;167m\]]\[\e[38;5;248m\]\\$\[\e[0m\] '

# alias added by zyuke:
alias vi="vim"
alias nv="nvim"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias sudo='sudo '

# use vim mode
set -o vi

# define default editor
export EDITOR=nvim
export VISUAL=nvim

# yazi wrapper
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# set up pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# define screenshot folder
export GRIM_DEFAULT_DIR=/home/zyuke/Pictures/Screenshots/

# starship
eval "$(starship init bash)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/zyuke/google-cloud-sdk/path.bash.inc' ]; then . '/home/zyuke/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/zyuke/google-cloud-sdk/completion.bash.inc' ]; then . '/home/zyuke/google-cloud-sdk/completion.bash.inc'; fi
