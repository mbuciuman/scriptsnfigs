# set home directory for script (to also support root)
export HOME="/home/mbuciuman-coman"

# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh

# gives terminal 256 color support
export TERM="rxvt-256color"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="tjkirch"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.oh-my-zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
     mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.zshhistfile
HISTSIZE=5000
SAVEHIST=100000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep
#bindkey -v # sets vi mode
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/cygdrive/c/Users/MBUCIUMAN-COMAN/.zshrc'

autoload -Uz compinit
compinit -D

# End of lines added by compinstall

eval $(ssh-agent) 1>/dev/null
ssh-add ~/.ssh/^(*.pub|known_hosts) < /dev/null &>/dev/null

# legacy git prompt script
# source /etc/profile.d/git-prompt.sh

# alias sudo='sudo '

alias ls='ls -Flah --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias d2u='sudo find . -type f -exec dos2unix {} \;'
alias se='sudoedit'
alias vim='nvim'
alias duy='sudo dnf update -y --best --allowerasing'

alias idea='/opt/idea-IU-162.2228.15/bin/idea.sh'
alias gt='git log --oneline --decorate --all --graph --simplify-by-decoration'

# TODO: make this alias work
# alias zip='7z -tzip'

#PATH
export PATH=$PATH:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/mbuciuman-coman/.local/bin:/home/mbuciuman-coman/bin:/tools:/opt/idea-IU-163.12024.16/bin:/home/mbuciuman-coman/scripts:/home/mbuciuman-coman/git_repos/pycharm-community-2016.3.2/bin
# python 2.7
#export PYTHONPATH=/data/git/hcp-automation-thirdparty:/data/git/hcp/python/product:/data/git/hcp-automation-library:/data/git/hcp-automation-tests:/data/git/loki:/usr/lib/python2.7/site-packages:/usr/lib/python3.6/site-packages:/usr/lib/python2.7
# python 3.6
#export PYTHONPATH=/data/git/hcp-automation-thirdparty:/data/git/hcp/python/product:/data/git/hcp-automation-library:/data/git/hcp-automation-tests:/data/git/loki:/usr/lib/python2.7/site-packages:/usr/lib/python3.6/site-packages:/usr/lib/python3.6

#view log of current branch
alias gitbl='git log --first-parent --no-merges'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

alias pdiff='/data/git/diff-tools/pdiff/pdiff'
alias gdiff='/data/git/diff-tools/gdiff/gdiff'

# when tapping the up and down keys, searches history using up/down arrows
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# 10ms for key sequences
KEYTIMEOUT=1

# remote desktop alias
#alias rdesktop='rdesktop -g 1920x1175'

# source docker aliases (useful back when I was on archlinux)
#source $HOME/aliases/aliases.sh
#source $HOME/aliases/docker_aliases.sh

# give less some color
export LESS='-R'
#export LESSOPEN='|$HOME/scripts/lessfilter.sh %s'

# set editor to nvim
export EDITOR=/usr/bin/nvim

# set JAVA_HOME envvar used by gradle to java 1.8
# export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

# change dir to home directory (PUT AT EOF)
cd
export XAUTHORITY=/home/mbc/.Xauthority
export CDPATH='/data/git'
