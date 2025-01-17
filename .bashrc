# beelleau - .bashrc - MacOS w/ homebrew
# configured on MacOS Sequoia

# if not running interactively, don't run any configurations
[[ $- != *i* ]] && return

# ensure session history
history -a

# don't put duplicate lines in history; ignore leading whitespace
HISTCONTROL=ignoreboth

# append to history file instead of overwrite
shopt -s histappend

# setting for history length and size
HISTSIZE=1000
HISTFILESIZE=4000

# check the window size after each command and update if necessary LINES/COLUMNS
shopt -s checkwinsize

# fancy PS1
export PS1=$'\[\e[1;37m\]\u\[\e[0m\]@\[\e[1;34m\]\h\[\e[0m\] \w \n \$ '

# enable bash completion via homebrew
[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && \
source "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

# assign EDITOR
[[ -x "$HOMEBREW_PREFIX/bin/nano" ]] && \
export EDITOR="$HOMEBREW_PREFIX/bin/nano"

# assign PAGER
if command -v less &>/dev/null; then
  export PAGER="less"
  # no .lesshst file
  export LESSHISTFILE=-
fi

# have ls and grep use colors
if command -v dircolors &>/dev/null; then
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vidr='vdir --color=auto'
  alias grep='grep --color=auto'
fi

# aliases
alias ll='ls -l'
alias la='ls -al'
alias lR='ls -lR'
alias laR='ls -laR'
alias lt='ls -ltr'
alias lat='ls -latr'
alias lv='ls -lv'
alias lav='ls -lav'
alias sudocat='sudo cat'
alias append='tee -a'
alias view='nano -v'
alias tp='type -P'

# if we have tree installed, create some tree aliases
if command -v tree &>/dev/null; then
  alias tree='tree -Ca -I .git --gitignore'
  alias sap='tree -Cap -I .git --gitignore'
fi

# functions
lax() {
  [[ $# -eq 0 ]] && ls -ld .??* 2>/dev/null
  [[ $# -eq 1 ]] && ls -ld "${1}"/.??* 2>/dev/null
  if [[ $# -gt 1 ]]; then
    local d
    local c=0
    for d in "$@"; do
      echo "${d}:"
      ls -ld "${d}"/.??* 2>/dev/null
      ((c++))
      [[ "$c" -eq $# ]] || echo ""
    done
  fi
}
