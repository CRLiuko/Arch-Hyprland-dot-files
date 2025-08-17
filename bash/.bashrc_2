#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

parse_git_branch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export EDITOR=nvim

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias neofetch='fastfetch'
PS1='[\[\033[0;36m\]\A \[\033[0;34m\]\[\033[0;31m\]\u\[\033[0;35m\]@\[\033[0;34m\]\h \[\033[0;32m\]\W\[\033[0;31m\]$(parse_git_branch)\[\033[0m\]]\[\033[1;33m\]\$\[\033[0m\] '

. "$HOME/.cargo/env"

. "$HOME/.local/bin/env"

eval "$(thefuck --alias)"
