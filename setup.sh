#!/bin/sh

# Some basic variables
script=$(basename $0)
user=$(logname)

# Required commands
pkgmgr="$(which pacman) -Syu --confirm"
sudo="$(which sudo)"
chsh="$(which chsh) -s"
su="$(which su) -u"

# Setup variables
packages="zsh vim git i3-wm stow"
modules="zsh i3 scripts vim x11 zsh"

# Custom echo to distinguish script output from command output
myecho() {
    echo "[$script] $1"
}

if [ $(id -u) -ne 0 ]; then
    myecho "Executed as user. Restarting with sudo.."
    $sudo $0
    exit
fi

myecho "Welcome to $script!"

myecho "Setting up environment for \"$user\""

myecho "1. Installing required packages.."
$pkgmgr $packages

myecho "2. Changing default shell to zsh.."
$chsh $(which zsh) $user

myecho "3. Changing to user mode for the rest of the setup.."
$su $user

myecho "4. Symlinking dofiles.."
$(which stow) -v -S $modules

myecho "All done. See you around!"
