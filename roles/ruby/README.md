#Ruby

This role will install rbenv (and ruby-build and rbenv-binstubs) using homebrew, if not already installed. It will then install the specified version of Ruby if necessary, set it to be the global version, and ensure the desired base gems are installed.

###Role Variables

All variables are in the roles vars/main.yml file, though they can be overridden by the group-vars or host-vars.

The variables consist of:
- ruby_homebrew_items - a list of the dependencies to be installed using homebrew
- ruby_version - the version of Ruby to install and set as global
- ruby_gems - the base set of gems to install

###Dependencies

The role does require that homebrew already be installed.

###Example Playbook

    - hosts: all
      roles:
         - ruby

###Author Information

Lovingly crafted by Albumen, albumen.dake@gmail.com
