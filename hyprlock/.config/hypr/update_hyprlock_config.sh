#!/bin/bash

template="$HOME/.config/hypr/hyprlock.template.conf"
output="$HOME/.config/hypr/hyprlock.conf"
wallpaper_path=$(cat "$HOME/.cache/current_wallpaper")

if [ -f "$template" ] && [ -n "$wallpaper_path" ]; then
    sed "s|{{WALLPAPER_PATH}}|$wallpaper_path|g" "$template" > "$output"
else
    echo "Template or wallpaper path missing."
    exit 1
fi

