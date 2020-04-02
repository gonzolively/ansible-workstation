#!/bin/bash

repo="git@github.com:gonzolively/dotfiles.git"
git clone --bare $repo $HOME/.dotfiles &&

function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

echo "Backing up pre-existing dot files."
mkdir -p $HOME/.dotfiles-backup &&
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I {} mv $HOME/{} $HOME/.dotfiles-backup/{} &&

config checkout &&
config config status.showUntrackedFiles no
