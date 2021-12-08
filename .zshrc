# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/dertoni/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"


# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

LS_COLORS="ow=01;36;40" && export LS_COLORS

export GOROOT=/usr/lib/go
export PATH=$PATH:$GOROOT/bin

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Alias for python3
alias py3=python3

# Clip
alias clip=/mnt/c/Windows/System32/clip.exe

# NVM config
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# exa replaces ls
alias ls=exa

# Personal configs
source ~/.personalrc

# Using zaproxy
alias zaproxy="java -jar /opt/zaproxy/zap-2.9.0.jar"

# Make Git Follow Symbolic Links
alias git-ln="LD_PRELOAD=~/.config/GitBSLR/gitbslr.so git"

# Set completion colors
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

# Adding nvim nightly to PATH
export PATH=~/.local/src/github/neovim/build/bin:$PATH
export PATH=$PATH:~/.local/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

bindkey -v

tmuxcwd() {
    tmux command-prompt -I $PWD -p "New session dir:" "attach -c %1"
}
zle -N tmuxcwd
bindkey '^a' tmuxcwd
