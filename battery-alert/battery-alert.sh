#!/bin/bash

BATTERY_FILE="/sys/class/power_supply/BAT0/capacity"
STATUS_FILE="/sys/class/power_supply/BAT0/status"
LOG_FILE="$HOME/.battery_alert.log"
ALERT_SOUND="/usr/share/sounds/freedesktop/stereo/dialog-warning.oga"

# Read battery percentage
read -r BATTERY_LEVEL < "$BATTERY_FILE"

# Read charging status
read -r STATUS < "$STATUS_FILE"

# Exit if battery is charging
if [[ "$STATUS" == "Charging" || "$STATUS" == "Full" ]]; then
    exit 0
fi

# Get last alert level (to avoid spam)
# If the log file is empty, default to a non-relevant value (e.g., 100)
LAST_ALERT=$(tail -n 1 "$LOG_FILE" 2>/dev/null | awk '{print $NF}')
LAST_ALERT="${LAST_ALERT:-100}"  # Default to 100 if empty

# Function to log and notify
send_alert() {
    echo "$(date) - Battery at ${BATTERY_LEVEL}% - Alert Sent" >> "$LOG_FILE"
    notify-send -u critical "Battery Low" "$1" -i battery-caution
    paplay "$ALERT_SOUND"  # Play warning sound
}

# Debugging: Print battery level and last alert to log
echo "Battery Level: $BATTERY_LEVEL, Last Alert: $LAST_ALERT" >> "$LOG_FILE"

# Alert logic
if (( BATTERY_LEVEL < 25 && LAST_ALERT != 25 )); then
    send_alert "Warning! Battery is below 25%. Consider plugging in."
elif (( BATTERY_LEVEL < 20 && LAST_ALERT != 20 )); then
    send_alert "Critical! Battery below 20%! Plug in immediately."
elif (( BATTERY_LEVEL < 15 && LAST_ALERT != 15 )); then
    send_alert "Danger! Battery below 15%! System may shut down soon!"
elif (( BATTERY_LEVEL < q0 && LAST_ALERT != 10 )); then
    send_alert "Emergency! Battery below 10%! Shutdown imminent!"
fi
