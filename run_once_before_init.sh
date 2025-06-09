#!/bin/bash

# This script installs Ansible on a Linux system.

# checking if ansible is already installed
if [ -x "$(command -v ansible)" ]; then
  echo "Ansible is already installed."
  echo "Updating system packages..."
  sudo pacman -Syu --noconfirm
  exit 0
else
  echo "Ansible is not installed. Proceeding with installation..."
  sudo pacman -Syu --noconfirm ansible
fi
echo "Ansible has been successfully installed."
