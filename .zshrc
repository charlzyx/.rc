# Chao's ZSH


# --------------------------------------------------------------------------
# MIRRORS
# --------------------------------------------------------------------------

# hombrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.cloud.tencent.com/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
# electron
export ELECTRON_MIRROR="https://npm.taobao.org/mirrors/electron/"
# sass
export SASS_BINARY_SITE="https://npm.taobao.org/mirrors/node-sass"

# --------------------------------------------------------------------------
# PATH, ENV, HOMES
# --------------------------------------------------------------------------

export ARCHFLAGS="-arch x86_64"
export PATH=$HOME/bin:/usr/local/bin:$PATH

# node
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# go
#export GO_HOME=/usr/local/go
#export GOPATH=$HOME/go
#export GO111MODULE=on
#export PATH=$GO_HOME/bin:$PATH
# java
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8);
export CLASSPATH=.:$JAVA_HOME/libn/dt.jar:$JAVA_HOME/lib/tools.jar;
#export MAVEN_HOME=$HOME/Library/maven;
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
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
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
  command-not-found
  safe-paste
  vi-mode
  # search history: by  cmd+P, cmd+N
  history-substring-search
)

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

source $ZSH/oh-my-zsh.sh


# --------------------------------------------------------------------------
# ZSH PLUGINS: zplug
# --------------------------------------------------------------------------

if [[ -f ~/.zplug/init.zsh ]] {
  source ~/.zplug/init.zsh
}


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

alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi="code-insiders"
alias vim="nvim"
alias ip="ipconfig getifaddr en0"
alias ssr="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=http://127.0.0.1:7890"
alias nossr="export https_proxy= http_proxy= all_proxy="
# node cli alias replace plugins git alias for git commit, by npm install git-cz
alias gc="git cz"
alias live="browser-sync start --server"
