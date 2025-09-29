#!/bin/bash

# Check parameters
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <package_manager> <package_list_file>"
  exit 1
fi

PKG_MANAGER="$1"
PKG_LIST_FILE="$2"

# Check that file exists
if [ ! -f "$PKG_LIST_FILE" ]; then
  echo "❌ Package list file not found: $PKG_LIST_FILE"
  exit 1
fi

# Read and filter packages (remove comments and blank lines)
mapfile -t PACKAGES < <(grep -vE '^\s*#|^\s*$' "$PKG_LIST_FILE")

if [ "${#PACKAGES[@]}" -eq 0 ]; then
  echo "❌ No valid packages found in file."
  exit 1
fi

echo "📦 Installing ${#PACKAGES[@]} packages using: $PKG_MANAGER"
echo "---------------------------------------------------------"

# Install command based on package manager
case "$PKG_MANAGER" in
  apt)
    sudo apt update
    sudo apt install -y "${PACKAGES[@]}"
    ;;
  snap)
    sudo snap install "${PACKAGES[@]}"
    ;;
  pacman)
    sudo pacman -Syu --noconfirm "${PACKAGES[@]}"
    ;;
  yay)
    yay -S --noconfirm "${PACKAGES[@]}"
    ;;
  *)
    echo "❌ Unsupported package manager: $PKG_MANAGER"
    exit 1
    ;;
esac

echo "✅ Done installing packages with $PKG_MANAGER."

