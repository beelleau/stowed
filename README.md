# Stowed Files
Contains configuration files for various GNU programs.  
- Bash  
- Emacs  
- Nano  
- Screen  

Files under the `served` directory are more focused towards production Linux systems, while files under the top directory are developed and used on MacOS using [Homebrew](https://brew.sh/).

## To Use
Get to your home directory:  
`cd`  

Clone this repository:  
`git clone https://github.com/beelleau/stowed.git`  

Change into the `stowed/` directory:  
`cd stowed`  

[Optional] Use GNU stow to create symlinks:  
`stow .`  

Or, copy the files into your home directory.  

## Installing GNU stow
You can install GNU `stow` via your system package manager.  

See more information about GNU stow [here](https://www.gnu.org/software/stow/).
