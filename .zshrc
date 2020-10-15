export ZSH="/Users/chao/.oh-my-zsh"
# hombrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.cloud.tencent.com/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
# flutter
export ENABLE_FLUTTER_DESKTOP=true
export PUB_HOSTED_URL="https://pub.flutter-io.cn"
export FLUTTER_STORAGE_BASE_URL"=https://storage.flutter-io.cn"
# electron
export ELECTRON_MIRROR="https://npm.taobao.org/mirrors/electron/"
# sass
export SASS_BINARY_SITE="https://npm.taobao.org/mirrors/node-sass"
# hasaki
#export HASAKI_HOME="/Users/chao/hasaki"
# go
#export GO_HOME="/usr/local/go"
#export MONGODB_HOME="/usr/local/share/mongodb"
#export GOPATH="$HOME/go";
#export GO111MODULE=on
# ENV HOMES
# deno
#export ANDROID_HOME=$HOME/Library/Android/sdk;
#export FLUTTER_HOME=$HOME/Library/flutter;
#export MAVEN_HOME=$HOME/Library/maven;
#export GRADLE_HOME=$HOME/Library/Gradle/gradle-5.6.4;
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8);
#export CLASSPATH=.:$JAVA_HOME/libn/dt.jar:$JAVA_HOME/lib/tools.jar;
#export SPRING_HOME=$HOME/Library/spring-2.2.3.RELEASE;
#export YARN_HOME=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles;
# append homes to path
export PATH="/usr/local/sbin:$PATH"
#export PATH="$FLUTTER_HOME/bin:\
#/usr/local/opt/gnu-getopt/bin:\
#$MONGODB_HOME/bin:\
#$GOPATH/bin:\
#$PANDOC_HOME/bin:\
#${DENO_HOME}/bin:\
#${ANDROID_HOME}:${ANDROID_HOME}/tools:\
#${ANDROID_HOME}/platform-tools:\
#${GRADLE_HOME}/bin:\
#${JAVA_HOME}/bin:\
#${CLASSPATH}:${MAVEN_HOME}/bin:\
#${SPRING_HOME}/bin:$PATH";

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="muse"

ZSH_THEME="af-magic"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# actions
alias sosh="source ~/.zshrc"
# editors
alias vi="code-insiders"
alias vim="nvim"
# helpers
alias live="browser-sync start --server"
alias ip="ipconfig getifaddr en0"
# Archer
# alias sso="pm2 start $HOME/archer/local.js --name archer"
# alias ssk="pm2 stop archer"
# proxy
alias ssr="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=http://127.0.0.1:7890"
alias nossr="export https_proxy= http_proxy= all_proxy="


HASAKI_HELP="我还在寻找回家的路。
    ——疾风剑豪·亚索。
hk                   启动服务
hk home              打开文件目录
hk cc                清理日志文件
hk clean             清理日志文件
hk reload            重启服务
hk r                 重启服务
hk kill              停用服务
hk stop              停用服务
hk l                 查看滚动日志
hk ll                使用cat查看日志
hk e                 查看滚动错误日志
hk ee                使用cat查看错误日志
hk help              查看当前帮助
hk h                 查看当前帮助"

function hk() {
  case $* in
  "")
    command echo "面对疾风吧!" && cd $HASAKI_HOME && sudo openresty -p $HASAKI_HOME -c $HASAKI_HOME/conf/nginx.conf && cd -
    ;;
  cc | clean)
    command echo "此剑之势，愈斩愈烈。——疾风剑豪·亚索。" && rm -f $HASAKI_HOME/logs/*.log
    ;;
  home)
    command echo "吾虽浪迹天涯，却未迷失本心。——疾风剑豪·亚索。" && cd $HASAKI_HOME
    ;;
  r | reload)
    command echo "死亡如风，常伴吾身。——疾风剑豪·亚索。" && cd $HASAKI_HOME && sudo openresty -p $HASAKI_HOME -c $HASAKI_HOME/conf/nginx.conf -s reload && cd -
    ;;
  kill | stop)
    command echo "死亡而已！没什么大不了的。——疾风剑豪·亚索。" && cd $HASAKI_HOME && sudo openresty -p $HASAKI_HOME -c $HASAKI_HOME/conf/nginx.conf -s stop && cd -
    ;;
  l)
    command echo "荣耀存于心，而非流于形。——疾风剑豪·亚索。" && tail -f $HASAKI_HOME/logs/access.log
    ;;
  ll)
    command echo "有些事绝对不会无趣。。——疾风剑豪·亚索。" && cat $HASAKI_HOME/logs/access.log
    ;;
  e)
    command echo "只要我E的够快, bug 追不上我。" && tail -f $HASAKI_HOME/logs/error.log
    ;;
  ee)
    command echo "蠢货是无药可治的！——疾风剑豪·亚索。" && cat $HASAKI_HOME/logs/error.log
    ;;
  *)
    command echo "$HASAKI_HELP"
    ;;
  esac
}
