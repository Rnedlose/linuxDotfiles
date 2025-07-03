#!/bin/bash

directory="$HOME/linuxDotfiles/backgrounds/.config/backgrounds"
wallpaper=$(find "$directory" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)

if [ -n "$wallpaper" ]; then
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$wallpaper"
    gsettings set org.gnome.desktop.background picture-uri "file://$wallpaper"
    echo "$wallpaper" > "$HOME/.cache/current_wallpaper"
    notify-send "Wallpaper Changed" "$(basename "$wallpaper")"
else
    echo "No suitable wallpapers found in $directory" >&2
fi

