#!/bin/sh
# Checks current lid state and enables/disables eDP-1 accordingly.
# Run at startup via niri config, and optionally via a udev rule for live events.
# Verify the niri msg output syntax with: niri msg --help
LAPTOP_OUTPUT="eDP-1"
LID_STATE_FILE="/proc/acpi/button/lid/LID0/state"

read -r LS < "$LID_STATE_FILE"

case "$LS" in
*open)   niri msg output "$LAPTOP_OUTPUT" on ;;
*closed) niri msg output "$LAPTOP_OUTPUT" off ;;
*)       echo "Could not get lid state" >&2 ; exit 1 ;;
esac
