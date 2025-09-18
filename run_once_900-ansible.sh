#!/usr/bin/env bash
set -euo pipefail

sudo pacman -Syu --noconfirm
command -v ansible >/dev/null || sudo pacman -S --noconfirm ansible

PLAYBOOK_DIR="$HOME/.local/share/chezmoi/playbook"

DISTRO=$(grep ^PRETTY_NAME= /etc/os-release | cut -d= -f2 | tr -d '"')

if [[ "$DISTRO" == *"Arch Linux"* ]]; then
  ansible-playbook -K -i localhost, -c local "$PLAYBOOK_DIR/desktop_playbook.yml"
elif [[ "$DISTRO" == *"Ubuntu"* ]]; then
  ansible-playbook -K -i localhost, -c local "$PLAYBOOK_DIR/laptop_playbook.yml"
fi
