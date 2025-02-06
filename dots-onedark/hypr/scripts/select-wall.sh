#!/bin/bash

WALLPAPER_DIR="$HOME/wallpapers"

# Function to get list of wallpapers
get_wallpapers() {
    ls "$WALLPAPER_DIR"
}

# Function to set wallpaper using hyprctl
set_wallpaper() {
    local wallpaper="$1"
    hyprctl hyprpaper preload "$wallpaper"
    hyprctl hyprpaper wallpaper "eDP-1,$wallpaper"  # Change eDP-1 to your monitor name
    sleep 0.1  # Give it a moment to load
    hyprctl hyprpaper unload all  # Clean up unused wallpapers
}

# Show wofi menu and set selected wallpaper
selected=$(get_wallpapers | wofi --style wofi-themes/themes/starter-greenish-blue.css --dmenu --prompt "Select wallpaper")

if [[ -n "$selected" ]]; then
    set_wallpaper "$WALLPAPER_DIR/$selected"
fi
