#!/bin/sh

# Could use i3-sensible-terminal directly but in this case
# the sleep timeout has to be adjusted

i3-msg "exec i3-sensible-terminal"
sleep 0.05
i3-msg "split h; split v"
