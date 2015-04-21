#!/bin/sh

# Some basic variables
script=$(basename $0)
user=$(logname)

# Required commands
sudo="$(which sudo)"
chsh="$(which chsh) -s"
su="$(which su) -u"

# Setup variables
pre_packages="package-query yaourt"
packages="zsh vim git i3 stow xorg-server polkit clang htop powertop ntfs-3g cups wget openssh"
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

myecho "1. Installing package-query and yaourt.."
sh <(curl aur.sh) -si $pre_packages
rm -rf $pre_packages

myecho "2. Installing remaining packages.."
$(which yaourt) --Syua --noconfirm $packages

myecho "3. Changing default shell to zsh.."
$chsh $(which zsh) $user

myecho "4. Changing to user mode for the rest of the setup.."
$su $user

myecho "5. Symlinking dofiles.."
$(which stow) -v -S $modules

myecho "All done. See you around!"
