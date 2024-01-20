#!/bin/bash

# Capture a screenshot
screenshot_path="/home/$USER/Pictures/Screenshots/screenshot-$(date -u +'%Y%m%d-%H%M%SZ').png"
maim --format=png --select "$screenshot_path"

# Activate the virtual environment
source /home/$USER/.config/i3/ImageToText/demo/bin/activate

# Run the Python script
python_script="/home/anukul/.config/i3/ImageToText/image_to_text.py"

/home/anukul/.config/i3/ImageToText/demo/bin/python "$python_script"

# Deactivate the virtual environment (optional)
deactivate
