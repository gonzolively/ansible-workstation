#!/bin/bash

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
backup_dir="$HOME/.dotfiles-backup-$timestamp"
repo="git@github.com:gonzolively/dotfiles.git"
git clone --bare $repo $HOME/.dotfiles &&

function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

echo "Backing up pre-existing dot files..."
mkdir -p $backup_dir &&
# TODO: Add a bit to create the existing directory structure (empty) before copying config over
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I {} mv $HOME/{} $backup_dir/{} &&
#config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I {} mkdir -p $backup_dir/{}; mv $HOME/{} $backup_dir/{} &&

config checkout &&
config config status.showUntrackedFiles no
