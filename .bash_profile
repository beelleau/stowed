# beelleau - .bash_profile - MacOS w/ homebrew
# configured on MacOS Sequoia

# add homebrew environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# adjust PATH to include homebrew
PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:\
$HOMEBREW_PREFIX/opt/findutils/libexec/gnubin:\
$HOMEBREW_PREFIX/opt/grep/libexec/gnubin:\
$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin:\
$HOMEBREW_PREFIX/opt/gnu-tar/libexec/gnubin:\
$PATH"

# add home bin to PATH
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"

export PATH

# add to MANPATH for GNU coreutils and other utilities
MANPATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:\
$HOMEBREW_PREFIX/opt/findutils/libexec/gnuman:\
$HOMEBREW_PREFIX/opt/grep/libexec/gnuman:\
$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin:\
$HOMEBREW_PREFIX/opt/gnu-tar/libexec/gnubin:\
$MANPATH"

export MANPATH

# chruby support
[[ -r "$HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh" ]] && \
  source "$HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh"

# enable chruby auto-switching by .ruby-version files
[[ -r "$HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh" ]] && \
source "$HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh"

# source .bashrc
[[ -r "$HOME/.bashrc" ]] && source "$HOME/.bashrc"
