#!/bin/bash

directory="$HOME/dotfiles/backgrounds/.config/backgrounds"
monitor=$(hyprctl monitors | awk '/Monitor/ {print $2}')

if [ -d "$directory" ]; then
    # Find all supported image types
    random_background=$(find "$directory" -type f \( \
        -iname "*.jpg" -o \
        -iname "*.jpeg" -o \
        -iname "*.png" -o \
        -iname "*.webp" \
    \) | shuf -n 1)

    if [ -n "$random_background" ]; then
        hyprctl hyprpaper unload all
        hyprctl hyprpaper preload "$random_background"
        hyprctl hyprpaper wallpaper "$monitor,$random_background"

        # Save current wallpaper to a file
        echo "$random_background" > "$HOME/.cache/current_wallpaper"

        # Update hyprlock config dynamically
        "$HOME/.config/hypr/update_hyprlock_config.sh"
    else
        echo "No image files found in $directory."
    fi
else
    echo "Directory $directory does not exist."
fi


