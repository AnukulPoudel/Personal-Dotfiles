#!/bin/bash

# Read battery percentage directly from sysfs
BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)

# Exit early if battery is 25% or higher
if [[ $BATTERY_LEVEL -ge 27 ]]; then
    exit 0
fi

# Send notification if battery is below 25%
notify-send -u critical "Battery Low" "Charge your laptop! Battery at $BATTERY_LEVEL%" -i battery-caution
