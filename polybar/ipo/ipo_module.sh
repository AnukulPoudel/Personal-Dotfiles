#!/bin/bash

# Execute the Python script to get the count of available IPOs
IPO_COUNT=$(python3 /home/anukul/.config/polybar/ipo/ipo_module.py)

# Output the IPO count
echo "$IPO_COUNT"
