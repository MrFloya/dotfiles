#!/bin/sh

repo='https://github.com/mrfloya/dotfiles.git'
target='~/.dotfiles'

git clone --recursive $repo $target

cd $target

./setup.sh
