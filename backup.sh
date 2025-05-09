#!/bin/bash

home="/home/frank"
# Paths using $HOME instead of ~
hypr_conf="$home/.config/hypr"
hypr_dot="./hyprland/.config/"

waybar_conf="$home/.config/waybar"
waybar_dot="./waybar/.config/"

zsh_conf="$home/.zshrc"
zsh_dot="./zshrc/"

nvim_conf="$home/.config/nvim"
nvim_dot="./nvim/.config/"

kitty_conf="$home/.config/kitty"
kitty_dot="./kitty/.config/"

# Create destination directories if needed
mkdir -p "$hypr_dot" "$zsh_dot" "$nvim_dot" "$kitty_dot"

# Copy files
cp -r "$hypr_conf" "$hypr_dot"
cp -r "$waybar_conf" "$waybar_dot"
cp "$zsh_conf" "$zsh_dot"
cp -r "$nvim_conf" "$nvim_dot"
cp -r "$kitty_conf" "$kitty_dot"
