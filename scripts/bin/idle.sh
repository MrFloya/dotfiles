#/bin/bash

if [[ -n "$WAYLAND_DISPLAY" ]]; then
    if systemctl --user -q is-active swayidle; then
        systemctl --user -q stop swayidle
    else
        systemctl --user -q start swayidle
    fi
else
    if xset q | grep -qF "DPMS is Enabled"; then
        xset -dpms s off
    else

        xset +dpms s default
    fi
fi
