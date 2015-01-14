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

# Start xbindkeys
xbindkeys

# Start i3
exec i3 -c ~/.config/i3/i3config
