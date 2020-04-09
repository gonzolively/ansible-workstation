#!/bin/bash


# This script is intended to be ran after a fresh os install in order to install ansible and start the deployment process.

command="export ANSIBLE_LOAD_CALLBACK_PLUGINS=1 && ansible-playbook -l localhost deploy.yml --vault-password-file vault_pass.txt --check --ask-become-pass"

# If available, use LSB to identify distribution
if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
   DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
# Otherwise, use release info file
else
   DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1)
fi

# Run platform specific commands
if [ "$DISTRO" == "Ubuntu" ]; 
then
   echo "This is Ubuntu"
   #sudo apt-add-repository -y ppa:ansible/ansible &&
   #sudo apt-get update &&
   #sudo apt-get install -y ansible &&
   #$command
elif [ "$DISTRO" == "Fedora" ]; 
then
   echo "This is Fedora"
elif [ "$DISTRO" == "ArchLinux" ];
then
   echo "This is Archlinux"
else
   echo "This is something else"
   exit 0
fi
