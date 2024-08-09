#!/bin/sh
swayidle -w \
        timeout 900 "~/.local/share/bin/lock.sh & sleep 0.1 && hyprctl dispatch dpms off" \
            resume "hyprctl dispatch dpms on" \
        timeout 1800 "systemctl suspend" \
        before-sleep "~/.local/share/bin/lock.sh" \

# timeout 600 "temp=$(brightnessctl g); brightnessctl set $((temp / 2))" \
#     resume "temp=$(brightnessctl g); brightnessctl set $((temp * 2))" \
