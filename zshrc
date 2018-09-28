# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/<user>/.oh-my-zsh

ZSH_THEME="robbyrussell"
DISABLE_AUTO_TITLE="true"

## Plugins ###

plugins=(
  git,
  python,
  zsh_reload
)

source $ZSH/oh-my-zsh.sh

### User configuration ###

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

WORKON_HOME=/Users/<user>/envs/
source /usr/local/bin/virtualenvwrapper.sh

export NVM_DIR="/Users/<user>/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/shims:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### Alias ###

ZSHRC_PATH="~/.zshrc"
alias edit-zsh="vi $ZSHRC_PATH"
alias view-zsh="cat $ZSHRC_PATH"
