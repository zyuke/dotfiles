# PATH
export PATH="$HOME/.local/bin:$PATH"

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='vim'
alias nv='nvim'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias sudo='sudo '        # allows alias expansion after sudo
alias lg='lazygit'
alias ni='neovide'

# Vi mode (zsh-style)
bindkey -v
export KEYTIMEOUT=1

# Default editor
export EDITOR=nvim
export VISUAL=nvim

# yazi wrapper (works unchanged in zsh)
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

# thefuck
eval "$(thefuck --alias)"

# zoxide
eval "$(zoxide init zsh)"

# atuin
eval "$(atuin init zsh --disable-up-arrow)"

# starship
eval "$(starship init zsh)"
