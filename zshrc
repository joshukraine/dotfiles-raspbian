export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=7

ZSH_THEME="joshukraine"
ZSH_CUSTOM=$HOME/.dotfiles-raspbian/oh-my-zsh/custom
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/aliases

HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

export BUNDLER_EDITOR="vim"
export EDITOR="vim"

export PATH="/home/pi/.rbenv/shims:/home/pi/.rbenv/bin:/usr/lib/arm-linux-gnueabihf/libfm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games"

eval "$(rbenv init -)"

