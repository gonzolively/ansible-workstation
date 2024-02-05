#!/bin/bash

#!/usr/bin/env bash

# This script is intended to be run after a fresh OS install to install Ansible and start the deployment process.
command="ansible-playbook -l localhost deploy.yml --vault-password-file .vault_pass.txt --ask-become-pass"

# Determine distribution
if command -v lsb_release >/dev/null; then
    DISTRO=$(lsb_release -is)
else
    DISTRO=$(uname -s)
fi

echo "Detected distribution: $DISTRO"

# Run platform-specific commands
case $DISTRO in
    Ubuntu)
        echo -e "\nInstalling Ansible...\n"
        sudo apt update
        sudo apt install -y software-properties-common
        sudo apt-add-repository --yes --update ppa:ansible/ansible
        sudo apt install -y ansible
        echo -e "\nAnsible installed successfully, now running playbook...\n"
        eval "$command"
        ;;
    Fedora)
        echo "This is Fedora"
        ;;
    ArchLinux|Arch)
        echo "This is Arch Linux"
        ;;
    *)
        echo "Unsupported distribution: $DISTRO"
        ;;
esac
