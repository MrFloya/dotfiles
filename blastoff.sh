#!/bin/sh

repo='https://github.com/1wilkens/dotfiles.git'
target='.dotfiles'

git clone --recursive $repo $target

cd $target

./setup.sh
