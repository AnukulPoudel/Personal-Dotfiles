# Define a mode for regular screenshot
mode "screenshot" {
    bindsym Print exec --no-startup-id maim --format=png --select "/home/$USER/Pictures/Screenshots/screenshot-$(date -u +'%Y%m%d-%H%M%SZ').png"
    bindsym $mod+Print mode "default"
}

# Define a mode for screenshot and text scanning
mode "screenshot_and_scan" {
    bindsym Print exec --no-startup-id /home/anukul/.config/i3/ImageToText/image_to_text.sh
}

# Set the default mode
set $mode_system "default"

# Switch to the regular screenshot mode when pressing Windows button + Print Screen
bindsym $mod+Print mode "screenshot"

# Switch to the screenshot and text scan mode when pressing Print Screen only
bindsym Print mode "screenshot_and_scan"
