#Python

Installs Python via Homebrew, along with the core packages needed for Ansible. Additional packages may be installed by including them in the vars file.

##Warning

If you are using Ansible to build/administer the local machine don't use this role. Installing Python in the middle of a run will make Ansible very unhappy. Only use this on remote machines.

###Requirements

Homebrew must be installed.

###Role variables

The vars/main.yml file contains the homebrew tap for Python, and a list of packages to install (using pip).

###Author information

Lovingly crafted by Albumen, albumen.dake@gmail.com
