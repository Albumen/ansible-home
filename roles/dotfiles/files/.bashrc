export PATH="~/bin:/usr/local/bin:/usr/local/opt:/usr/local:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
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
alias gpo='git push origin'
alias gpom='git push origin master'
alias gpoh='git push origin head'

alias brewu='brew cask update && brew update && brew upgrade && brew cleanup'
alias gemu='gem update --system && gem update && gem clean'
alias pipu="pip install --upgrade pip && pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
alias appleupdate='softwareupdate -i -a'
alias updateall='brewu && gemu && pipu && appleupdate'

alias ngstop='nginx -s stop'

# load up the git-aware prompt helper
source ~/.prompt-helper/prompt.bash
