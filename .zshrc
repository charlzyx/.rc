# Chao's ZSH
source "$HOME/.cargo/env"


# --------------------------------------------------------------------------
# MIRRORS
# --------------------------------------------------------------------------

# -- hombrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.cloud.tencent.com/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles

# -- for node
# electron
export ELECTRON_MIRROR="https://npm.taobao.org/mirrors/electron/"
# sass
export SASS_BINARY_SITE="https://npm.taobao.org/mirrors/node-sass"

# --------------------------------------------------------------------------
# PATH, ENV
# --------------------------------------------------------------------------
# -- bun
export BUN_INSTALL="$HOME/.bun"
# bun completions
[ -s "/Users/chao/.bun/_bun" ] && source "/Users/chao/.bun/_bun"

# -- docker
export DOCKER_BIN="/Applications/Docker.app/Contents/Resources/bin/"
# -- adb
export ADB="$HOME/platform-tools"
# -- PATH FINAL
export PATH=$ADB:$BUN_INSTALL/bin:$DOCKER_BIN:$HOME/bin:/usr/local/bin:$PATH;
# -- openssl
export OPENSSL_LIB_DIR=$(brew --prefix openssl)/lib
export OPENSSL_INCLUDE_DIR=$(brew --prefix openssl)/include
# ----- dev deps
# -- nvm
NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# -- go
export GO_HOME=/usr/local/go
export GOPATH=$HOME/go
export GO111MODULE=on
export PATH=$GO_HOME/bin:$PATH
# -- java
export JAVA_HOME=$(/usr/libexec/java_home -v 11);
export CLASSPATH=.:$JAVA_HOME/libn/dt.jar:$JAVA_HOME/lib/tools.jar;
export MAVEN_HOME=$HOME/Library/maven;
export PATH=$JAVA_HOME/bin:$PATH
# android
export ANDROID_HOME=$HOME/Library/Android/sdk;
export PATH=$ANDROID_HOME:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

# --------------------------------------------------------------------------
# ZSH CONFIG
# See https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template
# --------------------------------------------------------------------------

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="af-magic"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode auto
ENABLE_CORRECTION="false"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy/mm/dd"
plugins=(
  # ga, gc....
  git
  # quick cd
  z
  # cp with progress bar
  cp
  # history only in current dir
  per-directory-history
  # tip for not found commond
  # command-not-found
  safe-paste
  vi-mode
  # search history: by  cmd+P, cmd+N
)

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

source $ZSH/oh-my-zsh.sh

# --------------------------------------------------------------------------
# SSH
# --------------------------------------------------------------------------

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# --------------------------------------------------------------------------
# ALIAS
# --------------------------------------------------------------------------

alias szsh="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi="code-insiders"
alias vim="nvim"
alias \ping="gping"
alias ip="ipconfig getifaddr en0"
alias ssr="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=http://127.0.0.1:7890"
alias nossr="export https_proxy= http_proxy= all_proxy="
# node cli alias replace plugins git alias for git commit, by npm install git-cz
alias gc="git cz"
alias live="browser-sync start --server"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

