#Role: Homebrew

Ensures homebrew and brew-cask are installed, as well as any other specified taps, apps, and items.

One subsequent maintenance runs, the role will ensure that the specified taps, apps, and items remain present. It will *not*, however, remove items that are not in the role's lists, so the role cannot be used to fully enforce a complete configuration.

###Requirements

Installation of homebrew itself, and permissions management of the homebrew install location require sudo access. The tasks are set with ```become: yes```, but require that a password is provided. For single-machine setup runs, this is most easily accomplished by including the argument ```--ask-become-pass``` when executing the playbook from the command line.

Installation and use of homebrew requires git, which may not be present in a fresh OS X instance. Certain brew items require clang. Ensure that Command Line Tools are installed before using this role.

Some brew items requie the presence of Java. Java should be installed using this role, as one of the git items. Java-dependent items should be listed after Java in the list of items to install.

###Role Variables

The homebrew role uses three variables: ```homebrew_taps```, which contains the list of brew taps to tap before processing other items; ```homebrew_items```, which contains the list of brew items to install; and ```homebrew_cask_items```, which contains the list of brew cask items to install.

Previously, it was necessary to set an environment variable telling brew cask to put the apps in /Applications. This is no longer the case.

###Dependencies

Homebrew will need to download the recipes and the source or binary for each of the items to be installed. Depending on your environment, dot-files for curl and wget may be required to support these downloads. The dot-files can be installed using the **dotfiles** role.

###Example Playbook

```
- name: workstation setup
  hosts: all

  roles:
    - dotfiles
    - homebrew

  environment:
    PATH: "~/.rbenv/shims:~/bin:/usr/local/bin:/usr/local/opt:/usr/local:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
```

###Author Information

Lovingly crafted by Albumen, albumen.dake@gmail.com
