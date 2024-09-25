#!/bin/sh
# Times the screen off and puts it to background
swayidle \
    timeout 15 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &
# Locks the screen immediately
swaylock --screenshots --clock --indicator --indicator-radius 120 --indicator-thickness 7 --effect-blur 7x5
# Kills last background task so idle timer doesn't keep running
kill %%
