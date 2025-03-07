#!/bin/bash

# Get battery percentage
BATTERY_LEVEL=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}' | tr -d '%')

# Check if battery is below 25%
if [[ $BATTERY_LEVEL -lt 25 ]]; then
    notify-send -u critical "Battery Low" "Charge your laptop! Battery at $BATTERY_LEVEL%" -i battery-caution
fi
