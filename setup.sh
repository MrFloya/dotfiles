#!/bin/bash

# Some basic variables
script=$(basename $0)
user=$(logname)

# Setup variables
pre_packages="package-query yaourt"
packages="zsh vim i3-wm i3lock i3status stow xorg-server polkit clang htop powertop ntfs-3g cups wget openssh feh xorg-xrandr xorg-xrdb alsa-utils pkgfile archlinux-wallpaper xterm xorg-xbacklight"
modules="zsh git i3 scripts vim x11 zsh"

# Custom echo to distinguish script output from command output
say() {
	echo
    echo "[$script] $1"
	echo
}

if [ $(id -u) -e 0 ]; then
    say "Cannot run as root! Exiting!"
    exit
fi

say "Welcome to $script!"
say "Setting up environment for \"$user\""

say "1. Installing package-query and yaourt.."
bash <(curl aur.sh) -si $pre_packages
rm -rf $pre_packages

say "2. Installing remaining packages.."
$(which yaourt) -Syua --noconfirm $packages

say "3. Changing default shell to zsh.."
sudo chsh -s $(which zsh) $user

say "4. Preparing home folder.."
mkdir -p ~/.config # To prevent stow from linking the whole folder ;)
mkdir -p ~/{bin,tmp}

say "5. Symlinking dofiles.."
$(which stow) -v -S $modules

say "All done. See you around!"
