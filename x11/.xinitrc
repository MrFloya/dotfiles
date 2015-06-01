#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Merge .Xresources
xrdb -merge ~/.Xresources

# Set DPI
xrandr --dpi 192

# Allow local X connections for container
xhost +local:

# Set VDPAU environment variable
export VDPAU_DRIVER=i965

# Start i3
exec i3 -c ~/.config/i3/i3config
