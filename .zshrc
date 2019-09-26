# -------- TERMINAL OPTIONS -------

umask 022

HISTFILE=~/.zsh_history
HISTSIZE=100000000
SAVEHIST=100000000
setopt appendhistory
setopt SHARE_HISTORY
unsetopt autocd

COLORTERM=yes
CLICOLOR=yes
EDITOR='vim'
export EDITOR COLORTERM HISTFILE HISTSIZE SAVEHIST CLICOLOR

# -------- ALIAS --------
alias starwars='telnet towel.blinkenlights.nl'
alias gln='git log --graph --decorate --all'
alias git-log-search='git log --pretty=format:"%an - %s" | ack'
alias git-diff-search='git diff | grep -C 2'
alias svenv='source venv/bin/activate'
alias grep='grep --color'
alias cls='clear'
alias ls='lsd'
# alias ls='ls -FG'
alias cp='cp -rv'
alias mv='mv -v'
alias mkdir='mkdir -pv'

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
    zgen oh-my-zsh plugins/osx
    zgen oh-my-zsh plugins/screen
    zgen oh-my-zsh plugins/gpg-agent
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load peterhurford/git-it-on.zsh
    # completions
    zgen load zsh-users/zsh-completions src
    # theme
    # zgen oh-my-zsh themes/dpoggi
    zgen oh-my-zsh themes/miloshadzic
    # save all to init script
    zgen save
fi

# -----------------------------------------------
# zsh vcs_info helpers
# -----------------------------------------------
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:(hg*|git*):*' get-revision true
zstyle ':vcs_info:(hg*|git*):*' check-for-changes true
# Call vcs_info as precmd before every prompt.
prompt_precmd() {
    vcs_info
}
add-zsh-hook precmd prompt_precmd
# Must run vcs_info when changing directories.
prompt_chpwd() {
   FORCE_RUN_VCS_INFO=1
}
add-zsh-hook chpwd prompt_chpwd

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

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/mike/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
