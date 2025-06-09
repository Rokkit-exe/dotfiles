#!/bin/bash

# This script installs Ansible on a Linux system.
echo "Updating system packages..."
sudo pacman -Syu --noconfirm

# checking if ansible is already installed
if [ -x "$(command -v ansible)" ]; then
  echo "Ansible is already installed."
else
  echo "Ansible is not installed. Proceeding with installation..."
  sudo pacman -S --noconfirm ansible
fi
echo "Ansible has been successfully installed."
echo "Running Ansible playbook to configure the system..."
ansible-playbook -i localhost, -c local /home/frank/.local/share/chezmoi/dot_playbook/playbook.yml
