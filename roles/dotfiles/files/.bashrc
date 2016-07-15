#!/usr/bin/env bash

export PATH="~/bin:/usr/local/bin:/usr/local/opt:/usr/local:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
export RBENV_ROOT=~/.rbenv
export VAGRANT_HOME="~/.vagrant.d/"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# if rbenv is installed, fire it up
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH="~/anaconda3/bin:$PATH"

# point brew cask at /Applications instead of the default ~/Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# colorize the terminal window and the ls command
export CLICOLOR=1
export LSCOLORS='Gxfxcxdxdxegedabagacad'
alias ls='ls -FG'

export EDITOR="subl -n -w"
export GIT_EDITOR=$EDITOR

# some git aliases
alias gst='git status'
alias gpo='git push origin'
alias gpom='git push origin master'
alias gpod='git push origin develop'
alias gpoh='git push origin head'

alias brewu='brew cask update && brew update && brew upgrade && brew cleanup'
alias gemu='gem update --system && gem update && gem clean'
alias pipu="pip2 install --upgrade pip && pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
alias updateall='brewu && gemu && pipu && pipu'

alias ngstop='nginx -s stop'

# load up the git-aware, rbenv-aware prompt helper
source ~/.prompt-helper/prompt.bash
