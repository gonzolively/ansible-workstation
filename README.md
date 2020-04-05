# ansible-workstation
Ansible project to provision my favorite programs, utilities, and dotfiles for a personal workstation. The intention of this project is to give me true freedom and allow me to distro hop between my favorite Linux distributions with minimal to no headache.

[![Build Status](https://travis-ci.com/gonzolively/ansible-workstation.svg?branch=master)](https://travis-ci.com/gonzolively/ansible-workstation)
### Features
- Aimed to work on Arch, Fedora and Ubuntu.
- Installs my dotfiles.
- Installs favorite programs, utilities, and their dependencies.
- Automated deployment tests using Travis and Docker for Ubuntu/Fedora/Archlinux

### Installation
1. Download this repo.

`wget -O ansible-workstation.zip https://github.com/gonzolively/ansible-workstation/archive/master.zip`

2. Unzip the archive.

`unzip ansible-workstation.zip`

3. Cd inside the created archive.

`cd anaible-workstation`

4. Download *.vault_pass.txt* from your super secret location and place in the project root.

5. Run bootstrap script

`./bootstrap.sh`
