#!/usr/bin/env bash

source ~/.prompt-helper/colors.bash
source ~/.prompt-helper/preexec.bash

SCM_GIT='git'
SCM_GIT_CHAR='±'
SCM_NONE='NONE'
SCM_NONE_CHAR='○'
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" |"
SCM_THEME_PROMPT_SUFFIX="${green}|"
SCM_THEME_PROMPT_SUFFIX='|'
SCM_THEME_BRANCH_PREFIX=''
GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_PREFIX=" ${green}|"
GIT_THEME_PROMPT_SUFFIX="${green}|"
SCM_GIT_AHEAD_CHAR="↑"
SCM_GIT_BEHIND_CHAR="↓"
SCM_GIT_UNTRACKED_CHAR="?:"
SCM_GIT_UNSTAGED_CHAR="U:"
SCM_GIT_STAGED_CHAR="S:"
SCM_THEME_TAG_PREFIX='tag:'
SCM_THEME_COMMIT_PREFIX='commit:'
SCM_THEME_REMOTE_PREFIX=''

function ruby_version_prompt {
  if which rbenv &> /dev/null; then
    rbenv=$(rbenv version-name) || return
    if [ $rbenv != "system" ]; then
      echo -e "|$rbenv|"
    fi
  fi
}

function python_version_prompt {
  pyversion=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:3])))')
  echo -e "|$pyversion|"
}

function scm {
  if [[ -f .git/HEAD ]]; then SCM=$SCM_GIT
  elif which git &> /dev/null && [[ -n "$(git symbolic-ref HEAD 2> /dev/null)" ]]; then SCM=$SCM_GIT
  else SCM=$SCM_NONE
  fi
}

function scm_prompt_char {
  if [[ -z $SCM ]]; then scm; fi
  if [[ $SCM == $SCM_GIT ]]; then SCM_CHAR=$SCM_GIT_CHAR
  else SCM_CHAR=$SCM_NONE_CHAR
  fi
}

function git_prompt_vars {
  local details=''
  SCM_STATE=${GIT_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN}
  if [[ "$(git config --get bash-it.hide-status)" != "1" ]]; then
    local status="$(git status -b --porcelain 2> /dev/null || git status --porcelain 2> /dev/null)"
    if [[ -n "${status}" ]] && [[ "${status}" != "\n" ]] && [[ -n "$(grep -v ^# <<< "${status}")" ]]; then
      SCM_DIRTY=1
      SCM_STATE=${GIT_THEME_PROMPT_DIRTY:-$SCM_THEME_PROMPT_DIRTY}
    fi
  fi

  local ref=$(git symbolic-ref -q HEAD 2> /dev/null)
  if [[ -n "$ref" ]]; then
    SCM_BRANCH=${SCM_THEME_BRANCH_PREFIX}${ref#refs/heads/}
  else
    ref=$(git describe --tags --exact-match 2> /dev/null)
    if [[ -n "$ref" ]]; then
      SCM_BRANCH=${SCM_THEME_TAG_PREFIX}${ref}
    else
      local commit_re='(^remotes/)?(.+-g[a-zA-Z0-9]+)$'
      local remote_re='^remotes/(.+)$'
      ref=$(git describe --tags --all --always 2> /dev/null)
      if [[ "$ref" =~ ${commit_re} ]]; then
        SCM_BRANCH=${SCM_THEME_COMMIT_PREFIX}${BASH_REMATCH[2]}
      elif [[ "$ref" =~ ${remote_re} ]]; then
        SCM_BRANCH=${SCM_THEME_REMOTE_PREFIX}${BASH_REMATCH[1]}
      fi
    fi
  fi

  local ahead_re='.+ahead ([0-9]+).+'
  local behind_re='.+behind ([0-9]+).+'
  [[ "${status}" =~ ${ahead_re} ]] && SCM_BRANCH+=" ${SCM_GIT_AHEAD_CHAR}${BASH_REMATCH[1]}"
  [[ "${status}" =~ ${behind_re} ]] && SCM_BRANCH+=" ${SCM_GIT_BEHIND_CHAR}${BASH_REMATCH[1]}"

  local stash_count="$(git stash list 2> /dev/null | wc -l | tr -d ' ')"
  [[ "${stash_count}" -gt 0 ]] && SCM_BRANCH+=" {${stash_count}}"

  SCM_BRANCH+=${details}

  SCM_PREFIX=${GIT_THEME_PROMPT_PREFIX:-$SCM_THEME_PROMPT_PREFIX}
  SCM_SUFFIX=${GIT_THEME_PROMPT_SUFFIX:-$SCM_THEME_PROMPT_SUFFIX}
  SCM_CHANGE=$(git rev-parse HEAD 2>/dev/null)
}

function scm_char {
  scm_prompt_char
  echo -e "$SCM_CHAR"
}

function git_prompt_info {
  git_prompt_vars
  echo -e "$SCM_PREFIX$SCM_BRANCH$SCM_STATE$SCM_SUFFIX"
}


function scm_prompt_info {
  scm
  scm_prompt_char
  SCM_DIRTY=0
  SCM_STATE=''
  [[ $SCM == $SCM_GIT ]] && git_prompt_info && return

}

function prompt_command() {
  # uncomment for prompt with ruby version (be sure to comment out the other two)
  # PS1="\n${yellow}$(ruby_version_prompt) ${purple}\h ${reset_color}in ${green}\w\n${bold_cyan}$(scm_char)${green}$(scm_prompt_info) ${green}→${reset_color} "
  
  # uncomment for prompt with python version (be sure to comment out the other two)
  # PS1="\n${yellow}$(python_version_prompt) ${purple}\h ${reset_color}in ${green}\w\n${bold_cyan}$(scm_char)${green}$(scm_prompt_info) ${green}→${reset_color} "

  # uncomment for prompt with neither ruby nor python version (be sure to comment out the other two)
  PS1="\n${purple}\h ${reset_color}in ${green}\w\n${bold_cyan}$(scm_char)${green}$(scm_prompt_info) ${green}→${reset_color} "
}
PROMPT_COMMAND=prompt_command;

preexec_install

