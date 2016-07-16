#Ansible-home

This collection of roles and accompanying playbook performs initial setup and build of a personal OS X workstation/laptop. Much of this is ported from playbooks and roles I wrote for management of a fleet of developer stations at work, for my use at home. 

I am continuing to port items from the work version to this version.
- 2016-07-15: Add dot-files role

The playbook can be run for initial setup as well as periodic maintenance. The following items are (or will be as I port the roles) installed and/or maintained:
- SSH keys and configuration
- Home directory dot-files and dot-folders (.bash_profile, .bashrc, .gemrc, .prompt-helper, etc.)
- Homebrew and brew-cask, along with a handful of other taps
- Ruby (using rbenv)
- Python (using homebrew)
- A number of applications (using brew cask)

##Use

###Initial setup only
If you are running this for the first time on a new or clean machine, you'll need to either:
- install the Command Line Tools (required for most other items we'll install)

    You can install the Command Line Tools by entering the following in Terminal:
	```
	xcode-select --install
	```
        
- or, install Xcode

    You can install Xcode through the AppStore, or by downloading from https://developer.apple.com/download

- Clone this repo
- ```cd``` into the cloned repo
- Either edit the workstation_playbook.yml playbook and comment out the security role, or add your ssh keys and config to the security role (see the README.md in the security role for instructions)

###On every run
- You'll need to download a local copy of Ansible and configure it to run, and ensure the necessary python libraries/utilities are available. Do this by running the included setup script:
    ```
    sh scripts/setup.sh
    ```
 
- Set up the environment for Ansible to run:
	```
    source ansible/hacking/env-setup
    ```
- Execute the Ansible playbook (this is a single line, though it may appear wrapped here):

    ```bash
    ansible-playbook workstation.yml -i "localhost," -c local --ask-become-pass --ask-vault-pass
    ```
    If you are not using the security role to install your SSH files, nor using any other vault-protected files, you can omit the ```--ask-vault-pass``` bit from the ```ansible-playbook``` command.
    
	Note that the playbook command above will execute on localhost. If you wish to manage one or more remote systems, edit the inventory file and (if needed) the group vars or host vars files as needed, then specify the inventory file in the command... replace ```-i "localhost, -c local``` with ```-i inventory```.


###Author Information

Lovingly crafted by Albumen, albumen.dake@gmail.com

