#!/bin/sh
# Times the screen off and suspends — adapted from sway/lockman.sh for niri
swayidle \
    timeout 15 'niri msg action power-off-monitors' \
    resume 'true' \
    timeout 20 'systemctl suspend' &
# Lock immediately
swaylock --screenshots --clock --indicator --indicator-radius 120 --indicator-thickness 7 --effect-blur 7x5
# Kill the background idle timer so it doesn't linger after unlock
kill %%
