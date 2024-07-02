# beelleau - .bash_profile - served

# add home bin to PATH
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"

# export PATH now
export PATH

# source .bashrc
[[ -r "$HOME/.bashrc" ]] && source "$HOME/.bashrc"
