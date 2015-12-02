#!/bin/bash

# set_wp.sh
# changes the current wallpaper used by awesome vm via a symlink

wallpaper_given=$1
wallpaper_target="/home/florian/images/wallpaper/awesome_current_wallpaper"

# update symlink
ln -fs $wallpaper_given $wallpaper_target

# restart awesome
echo 'awesome.restart()' | awesome-client -
