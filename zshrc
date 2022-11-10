# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/camilamaia/.oh-my-zsh

ZSH_THEME="avit"
DISABLE_AUTO_TITLE="true"

## Plugins ###

plugins=(git git-flow brew history node npm kubectl iterm-tab-color)

source $ZSH/oh-my-zsh.sh
. /Users/camilamaia/.oh-my-zsh/plugins/z/z.sh

### User configuration ###

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export WORKON_HOME=/Users/camilamaia/envs/
source /usr/local/bin/virtualenvwrapper.sh

export NPM_TOKEN=""
export PIP_EXTRA_INDEX_URL=""

export NVM_DIR="/Users/camilamaia/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# cat ~/.aws/credentials
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### Alias ###

WORKSPACE_DIR="~/workspace"

# ScanAPI

alias scanner="cd $WORKSPACE_DIR/scanapi && workon scanner && code ."

# Python

alias py-clean-cache="find . -name '*.pyc' -exec rm -f {} \;"
alias py-cache="find . -name '*.pyc';"

# Notes

alias notes="cd ~/notes && code ."

# iTerm tab color

alias tc-black="tc 0 0 0"
alias tc-white="tc	255 255 255"
alias tc-red="tc 255 0 0"
alias tc-lime="tc 0 255 0"
alias tc-blue="tc 0 0 255"
alias tc-yellow="tc 255 255 0"
alias tc-cyan="tc 0 255 255"
alias tc-magenta="tc 255 0 255"
alias tc-silver="tc 192 192 192"
alias tc-gray="tc 128 128 128"
alias tc-maroon="tc 128 0 0"
alias tc-olive="tc 128 128 0"
alias tc-green="tc 0 128 0"
alias tc-purple="tc 128 0 128"
alias tc-teal="tc 0 128 128"
alias tc-navy="tc 0 0 128"
alias tc-orange="tc 255 165 0"

# Golang

export GOPATH=$HOME/go

# ZSH

ZSHRC_PATH="~/.zshrc"

alias edit-zsh="code $ZSHRC_PATH"
alias view-zsh="cat $ZSHRC_PATH"


# SET ITERM TAB TITLE TO CURRENT WORKING DIRECTORY

DISABLE_AUTO_TITLE="true"

iterm_tab_title() {
  title="\e]0;${PWD##*/}\a"
  title_upper=$(echo $title | tr '[:lower:]' '[:upper:]')
  echo -ne $title_upper
}

add-zsh-hook precmd iterm_tab_title

# END

export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:/usr/local/sbin:$PATH"
export PATH=${PATH}:/Users/camilamaia/go/bin
export PATH=${PATH}:~/.local/bin
source /Users/camilamaia/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
