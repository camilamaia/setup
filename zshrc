# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/camilamaia/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
  git,
  python,
  zsh_reload
)

source $ZSH/oh-my-zsh.sh

### Alias ###

ZSHRC_PATH="~/.zshrc"
alias edit-zsh="vi $ZSHRC_PATH"
alias view-zsh="cat $ZSHRC_PATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
