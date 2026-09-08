# PATH
export PATH="$HOME/.local/bin:$PATH"

# zsh settings
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_ALL_DUPS    # no duplicate commands
setopt HIST_REDUCE_BLANKS      # trim extra spaces
setopt INC_APPEND_HISTORY      # write history immediately
setopt SHARE_HISTORY           # share across terminals
setopt EXTENDED_HISTORY        # timestamps

eval "$(dircolors -b)"         # Load GNU dircolors
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

setopt AUTO_CD              # cd by typing folder name
setopt CORRECT              # typo correction
setopt INTERACTIVE_COMMENTS # allow comments in shell
setopt NO_BEEP              # silence

# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='vim'
alias nv='nvim'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias sudo='sudo '        # allows alias expansion after sudo
alias lg='lazygit'
alias ni='neovide'

# vi mode
bindkey -v
export KEYTIMEOUT=1

# default editor
export EDITOR=nvim
export VISUAL=nvim

# yazi wrapper
y() {
  local tmp
  tmp="$(mktemp -t yazi-cwd.XXXXXX)"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [[ -n "$cwd" && "$cwd" != "$PWD" ]]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# zoxide
eval "$(zoxide init zsh)"

# atuin
eval "$(atuin init zsh --disable-up-arrow)"

# starship
eval "$(starship init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/zyuke/downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/zyuke/downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/zyuke/downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/zyuke/downloads/google-cloud-sdk/completion.zsh.inc'; fi
