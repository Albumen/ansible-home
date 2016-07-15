#!/usr/bin/env bash

# prepare local ansible copy
function setupAnsible {
  if [ -d "ansible" ]; then    # if ansible is already present, update it
    cd ansible
    git pull --rebase
    git submodule update --init --recursive
    cd ..
  else    # if it isn't already present, clone it
    git clone https://github.com/ansible/ansible.git --recursive
  fi
}

function installPip {
  command -v pip >/dev/null 2>&1 || { 
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    python $DIR/get-pip.py
  }
}

function setupPrerequisites {
  pip install --upgrade paramiko Jinja2 pycrypto ecdsa pycparser pyyaml
  pip install --upgrade six markupsafe nose mock coverage
}

installPip
setupPrerequisites
setupAnsible
