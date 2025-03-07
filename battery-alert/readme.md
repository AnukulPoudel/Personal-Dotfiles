# Battery Alert Script for Arch Linux

This script monitors the battery level and alerts the user when it drops below 25% using `dunst` notifications.

## Prerequisites

Make sure you have `upower` and `dunst` installed on your system:

```bash
sudo pacman -S upower dunst
```

## Setup Using systemd

To automate the script execution using `systemd`, follow these steps:

### 1. Create the Battery Alert Script

Save the following script as `battery_alert.sh` and make it executable:

```bash
#!/bin/bash

# Get battery percentage
BATTERY_LEVEL=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}' | tr -d '%')

# Check if battery is below 25%
if [[ $BATTERY_LEVEL -lt 25 ]]; then
    notify-send -u critical "Battery Low" "Charge your laptop! Battery at $BATTERY_LEVEL%" -i battery-caution
fi
```

Make it executable:

```bash
chmod +x battery_alert.sh
```

### 2. Create a systemd Service

Create a `systemd` service file at `~/.config/systemd/user/battery_alert.service`:

```ini
[Unit]
Description=Battery Alert Service

[Service]
ExecStart=/path/to/battery_alert.sh
```

Replace `/path/to/battery_alert.sh` with the actual path to your script.

### 3. Create a systemd Timer

Create a timer file at `~/.config/systemd/user/battery_alert.timer`:

```ini
[Unit]
Description=Run battery alert every 5 minutes

[Timer]
OnBootSec=1min
OnUnitActiveSec=5min
Unit=battery_alert.service

[Install]
WantedBy=timers.target
```

### 4. Enable and Start the Timer

Run the following command to enable and start the timer:

```bash
systemctl --user enable --now battery_alert.timer
```

### 5. Check Timer Status

To verify that the timer is running, use:

```bash
systemctl --user list-timers --all
```

To check logs:

```bash
journalctl --user -u battery_alert.service --follow
```

## Uninstall

To stop and disable the timer:

```bash
systemctl --user disable --now battery_alert.timer
```

To remove the files:

```bash
rm ~/.config/systemd/user/battery_alert.{service,timer}
```

---

Now your system will automatically notify you when your battery is low! 🚀

