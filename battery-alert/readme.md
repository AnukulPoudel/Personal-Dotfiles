# Battery Alert Script

This script monitors the battery level on Linux systems and sends notifications and plays an alert sound when the battery reaches critical levels (below 25%, 20%, 15%, or 10%).

## Features
- Sends notifications and lays a warning sound when the battery reaches 25%, 20%, 15%, or 10%.
- Log of sent alerts stored in a file.

## Requirements
- `notify-send` for displaying notifications.
- `paplay` for playing sounds (part of the `pulseaudio-utils` package).
- `udev` rules to automatically trigger the script based on battery levels.

## Installation

### Step 1: Install Required Packages
Ensure you have the required packages installed on your system.

```bash
sudo apt-get install libnotify-bin pulseaudio-utils
```

### Step 2: Create the Script

1. Save the battery alert script to your preferred location, for example, `~/.config/systemd/user/battery_alert.sh`.

2. Make the script executable:
```bash
chmod +x ~/.config/systemd/user/battery_alert.sh
```

### Step 3: Create a `udev` Rule to Trigger the Script

1. Create a new `udev` rule file:
```bash
sudo nano /etc/udev/rules.d/99-battery-alert.rules
```

2. Add the following lines to trigger the script when the battery reaches critical levels:

```bash
# Trigger script when battery reaches 25%, 20%, 15%, or 10%
SUBSYSTEM=="power_supply", ATTR{capacity}=="25", RUN+="~/.config/systemd/user/battery_alert.sh"
SUBSYSTEM=="power_supply", ATTR{capacity}=="20", RUN+="~/.config/systemd/user/battery_alert.sh"
SUBSYSTEM=="power_supply", ATTR{capacity}=="15", RUN+="~/.config/systemd/user/battery_alert.sh"
SUBSYSTEM=="power_supply", ATTR{capacity}=="10", RUN+="~/.config/systemd/user/battery_alert.sh"
```

3. Reload the `udev` rules:
```bash
sudo udevadm control --reload-rules
sudo udevadm trigger
```

## Usage

Once everything is set up, the script will automatically trigger when the battery level reaches 25%, 20%, 15%, or 10%, displaying notifications and playing alert sounds.

- **Notification**: A notification will pop up with the battery status.
- **Sound**: An alert sound will play when the battery level reaches 25%, 20%, 15%, or 10%, displaying notifications and playing alert sounds.

## Logs

All alert events are logged to the following file: `$HOME/.battery_alert.log`. You can check this log to see when the script was triggered.

```bash
cat ~/.battery_alert.log
```

## Removal

### Step 1: Remove `udev` Rule
To remove the `udev` rule and stop the script from being triggered:

```bash
sudo rm /etc/udev/rules.d/99-battery-alert.rules
```

### Step 2: Delete the Script
You can also delete the script from your system:

```bash
rm ~/.config/systemd/user/battery_alert.sh
```

### Step 3: Reload `udev` Rules
After removing the `udev` rule, reload the rules to apply the changes:

```bash
sudo udevadm control --reload-rules
```

## Troubleshooting

- **Permissions**: Ensure that the script has execute permissions (`chmod +x battery_alert.sh`).
- **Testing**: Test the script manually by running it directly to ensure it's working as expected:
  ```bash
  ./battery_alert.sh
  ```
- **Sound Issues**: If you don’t hear the sound, ensure `pulseaudio-utils` is installed and your system's sound is working correctly.

---

Feel free to modify the script to fit your needs!
