#!/usr/bin/env bash
set -euo pipefail

INSTALLER_DIR="$HOME/.local/share/chezmoi/dot_rokkit/scripts"
PACKAGES_DIR="$HOME/.local/share/chezmoi/dot_rokkit/packages"
DISTRO=$(grep ^PRETTY_NAME= /etc/os-release | cut -d= -f2 | tr -d '"')

if [[ "$DISTRO" == *"Arch Linux"* ]]; then
  sudo pacman -Syu --noconfirm

  sudo $INSTALLER_DIR/install_helper.sh
  sudo $INSTALLER_DIR/install_packages.sh pacman $PACKAGES_DIR/pacman.txt 
  sudo $INSTALLER_DIR/install_packages.sh yay $PACKAGES_DIR/yay.txt
  sudo $INSTALLER_DIR/disable_usb.sh
  sudo $INSTALLER_DIR/mount_drive.sh
  sudo $INSTALLER_DIR/install_cider.sh
  sudo $INSTALLER_DIR/install_lazyvim.sh
  sudo $INSTALLER_DIR/setup_grub.sh
  sudo $INSTALLER_DIR/setup_sddm.sh
  sudo $INSTALLER_DIR/setup_zsh.sh
  sudo $INSTALLER_DIR/setup_virtualization.sh
  
elif [[ "$DISTRO" == *"Ubuntu"* ]]; then
  sudo apt update -y && sudo apt full-upgrade -y

  sudo $INSTALLER_DIR/install_packages.sh apt $PACKAGES_DIR/apt.txt 
  sudo $INSTALLER_DIR/install_packages.sh snap $PACKAGES_DIR/snap.txt
  sudo $INSTALLER_DIR/install_docker.sh
  sudo $INSTALLER_DIR/install_nerd_fonts.sh
  sudo $INSTALLER_DIR/install_lazyvim.sh
fi



