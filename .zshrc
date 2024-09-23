# -------- TERMINAL OPTIONS -------

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
    fzf
    gitfast
    gpg-agent
)

# -------- ALIAS --------
alias gln='git log --graph --decorate --all'
alias git-log-search='git log --pretty=format:"%an - %s" | ack'
alias git-diff-search='git diff | grep -C 2'
alias grep='grep --color'
alias cls='clear'
alias ls='ls -FG'
alias cp='cp -rv'
alias mv='mv -v'
alias mkdir='mkdir -pv'
alias cat='bat'
alias nombom="rm -rf node_modules/ && npm i"
alias ss='python -m http.server'
alias k='kubectl'

COMPLETION_WAITING_DOTS="true"

# -----------------------------------------------
# env overrides
# -----------------------------------------------
export LESS=-RXFEm

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

# add homebrew to path
export PATH=/opt/homebrew/bin:$PATH

# setup fuzzy history search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $ZSH/oh-my-zsh.sh
