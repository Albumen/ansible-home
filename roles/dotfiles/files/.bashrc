#!/usr/bin/env bash

export PATH="./bin:~/bin:/usr/local/bin:/usr/local/opt:/usr/local:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
export VAGRANT_HOME="~/.vagrant.d/"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# colorize the terminal window and the ls command
export CLICOLOR=1
export LSCOLORS='Gxfxcxdxdxegedabagacad'
alias ls='ls -FG'

export EDITOR="atom -w"
export GIT_EDITOR=$EDITOR

# some git aliases
alias gst='git status'
alias gpom='git push origin master'

alias brewu='brew update && brew upgrade && brew cleanup'
#alias gemu='gem update --system && gem update && gem clean'
alias gemu='bundle update'
alias pipu="pip install --upgrade pip && pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
# alias pip3u="pip3 install --upgrade pip && pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U"
alias appleupdate="softwareupdate -i -a && mas upgrade"
# alias updateall='brewu && gemu && pipu && pip3u'
alias updateall='brewu && gemu && pipu && appleupdate'
# alias piposu="/Library/Frameworks/Python.framework/Versions/3.5/bin/pip3 install --upgrade pip && /Library/Frameworks/Python.framework/Versions/3.5/bin/pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 /Library/Frameworks/Python.framework/Versions/3.5/bin/pip3 install -U"
alias ngstop='nginx -s stop'

# load up the git-aware, rbenv-aware prompt helper
source ~/.prompt-helper/prompt.bash
