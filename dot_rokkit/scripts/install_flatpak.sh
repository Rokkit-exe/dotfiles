#!/usr/bin/env bash
# install-flatpak.sh — Install Flatpak and add the Flathub repo on Ubuntu/Debian
set -euo pipefail

if ! command -v apt-get >/dev/null 2>&1; then
  echo "This script is for Ubuntu/Debian (apt-based) systems."
  exit 1
fi

echo "[1/4] Updating package index..."
sudo apt-get update -y

echo "[2/4] Installing Flatpak..."
sudo apt-get install -y flatpak

# Optional GUI integration: install a plugin based on your desktop environment.
DESKTOP="${XDG_CURRENT_DESKTOP:-}"
if [[ "$DESKTOP" =~ (GNOME|gnome|ubuntu:GNOME) ]]; then
  echo "[3/4] Installing GNOME Software Flatpak plugin..."
  sudo apt-get install -y gnome-software-plugin-flatpak || true
else
  echo "[3/4] Skipping GUI plugin (unknown desktop: \"$DESKTOP\")."
  echo "      You can install later: gnome-software-plugin-flatpak or plasma-discover-backend-flatpak"
fi

echo "[4/4] Adding Flathub system remote (if missing)..."
sudo flatpak remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Done ✅"
flatpak --version
echo "Current Flatpak remotes:"
flatpak remotes --system --columns=name,options,url

echo
echo "Tip: log out/in (or reboot) for GUI store integration to show Flatpak apps."
echo "Try a quick test:   flatpak search org.mozilla.firefox"
