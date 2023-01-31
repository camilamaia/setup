### ZSH ###

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8

ZSH_THEME="avit"

# Plugins
plugins=(
  git
  z
  git-flow
  brew
  history
  zsh-autosuggestions
  kubectl
  iterm-tab-color
)

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

### END ZSH ###

### ALIAS ###

ZSHRC_PATH="~/.zshrc"

alias edit-zsh="code $ZSHRC_PATH"
alias show-zsh="cat $ZSHRC_PATH"

WORKSPACE_DIR="~/workspace"

alias work="cd $WORKSPACE_DIR"

# Python

alias py-clean-cache="find . -name '*.pyc' -exec rm -f {} \;"
alias py-cache="find . -name '*.pyc';"

### END ALIAS ###

### ITERM TAB TITLE ###

# Alias for colours

alias tc-black="tc 0 0 0"
alias tc-white="tc 255 255 255"
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

# Set iterm tab title to current working directory
iterm_tab_title() {
  title="\e]0;${PWD##*/}\a"
  title_upper=$(echo $title | tr '[:lower:]' '[:upper:]')
  echo -ne $title_upper
}

add-zsh-hook precmd iterm_tab_title

### END ITERM TAB TITLE ###

### FZF ###

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# History configuration
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY            # append to history file
setopt HIST_NO_STORE             # Don't store history commands

# To install useful key bindings and fuzzy completion:
export FZF_DEFAULT_OPTS='--height 40% --border --color'

bindkey "${terminfo[kcuu1]}" fzf-history-widget # Bind "up arrow" key to fzf command

# ch - browse chrome history
ch() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f ~/Library/Application\ Support/Google/Chrome/Profile\ 3/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

### END FZF ###

### OTHERS ###

export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# kubectl autocomplete
source <(kubectl completion zsh)

# thefuck
eval $(thefuck --alias oops)

# zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

