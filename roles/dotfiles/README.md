#Role: dotfiles

Installs dot-files and dot-folders to the target home directory. This role is used very early in the configuration flow to support or enable later roles.

The file copy/installation uses the Ansible copy module, so is idempotent.

###Requirements

The role installs dot-files from local ```files``` directory within the role, so does not need access to the internet. The role will place the files using the ```ansible_env.USER``` value as owner; if this is not the user running the playbook / role, appropriate permissions will need to be provided.

###Role Variables

The role's ```vars/main.yml``` file defineds two lists: ```home_dir_dot_files```, which is the list of files to copy from the role's ```files``` directory to the target home directory; and ```home_dir_dot_folders```, which is the list of folders to copy from the role's ```files``` directory to the target home directory.

###Dependencies

If this role is run locally using the account to be built/configured, there are no other dependencies. If the role is run remotely or as a user other than the one being configured, appropriate permissions must be provided.

###Example Playbook

Nothing special here at all.
```
- name: workstation setup
  hosts: all

  roles:
    - dotfiles
```

###Author Information
Lovingly crafted by Albumen, albumen.dake@gmail.com
