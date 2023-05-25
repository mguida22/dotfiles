# -------- TERMINAL OPTIONS -------

# setopt HIST_IGNORE_ALL_DUPS

# umask 022

# HISTFILE=~/.zsh_history
# HISTSIZE=100000000
# SAVEHIST=100000000
# setopt appendhistory
# setopt SHARE_HISTORY
# unsetopt autocd

COLORTERM=yes
CLICOLOR=yes
EDITOR='vim'
# export EDITOR COLORTERM HISTFILE HISTSIZE SAVEHIST CLICOLOR
export EDITOR COLORTERM CLICOLOR

# -------- ALIAS --------
alias gln='git log --graph --decorate --all'
alias git-log-search='git log --pretty=format:"%an - %s" | ack'
alias git-diff-search='git diff | grep -C 2'
alias grep='grep --color'
alias cls='clear'
alias ls='lsd'
# alias ls='ls -FG'
alias cp='cp -rv'
alias mv='mv -v'
alias mkdir='mkdir -pv'
alias cat='bat'
alias nombom="rm -rf node_modules/ && npm i"
alias ss='python -m http.server'
alias k='kubectl'

# -----------------------------------------------
# zgen
# -----------------------------------------------
COMPLETION_WAITING_DOTS="true"
# load zgen
source "${HOME}/.zgen/zgen.zsh"
# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"
    zgen oh-my-zsh
    # plugins
    zgen oh-my-zsh plugins/npm
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/gitfast
    zgen oh-my-zsh plugins/git-extras
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/macos
    zgen oh-my-zsh plugins/screen
    zgen oh-my-zsh plugins/gpg-agent
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load peterhurford/git-it-on.zsh
    # completions
    zgen load zsh-users/zsh-completions src
    # theme
    # zgen oh-my-zsh themes/dpoggi
    # zgen oh-my-zsh themes/miloshadzic
    zgen oh-my-zsh themes/robbyrussell
    # save all to init script
    zgen save
fi

# -----------------------------------------------
# env overrides
# -----------------------------------------------
export LESS=-RXFEm

# -----------------------------------------------
# nice login stuff
# -----------------------------------------------
echo "\nWelcome ${USER}"

# load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# enable auto nvm use
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# heroku autocomplete setup
# HEROKU_AC_ZSH_SETUP_PATH=/Users/mike/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# add python user-base to path
export PATH="$PATH:/Users/mike/.local/bin"

# enable pyenv shims and autocompletion
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# enable pipenv completions
eval "$(pipenv --completion)"

# add openssl to path for psycopg2
export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix openssl)/lib

# setup fuzzy history search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# set cache directory for shared streets
export SHST_CACHE_DIR=~/.shst/

# asdf setup
. $HOME/.asdf/asdf.sh
