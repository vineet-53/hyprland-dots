#!/bin/sh
swayidle -w \
        before-sleep "~/.local/share/bin/lock.sh" \
        timeout 160 'temp=$(brightnessctl g); brightnessctl set $((temp / 2))' \
            resume 'temp=$(brightnessctl g); brightnessctl set $((temp * 2))' \
        timeout 300 "~/.local/share/bin/lock.sh & sleep 0.1 && hyprctl dispatch dpms off" \
            resume 'hyprctl dispatch dpms on' \
        timeout 600 'systemctl suspend' \
            resume 'hyprctl dispatch dpms on'
