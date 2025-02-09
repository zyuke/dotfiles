#!/bin/bash

# Get the resolution of the primary monitor using swaymsg
RESOLUTION=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .current_mode.width, "x", .current_mode.height' | tr -d '\n')

# Extract width and height
WIDTH=$(echo $RESOLUTION | cut -d'x' -f1)
HEIGHT=$(echo $RESOLUTION | cut -d'x' -f2)

# Launch gamescope with the detected resolution
gamescope -w $WIDTH -h $HEIGHT -f -m 1 -e -- steam -gamepadui
