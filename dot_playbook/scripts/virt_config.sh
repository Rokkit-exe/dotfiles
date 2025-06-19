#!/bin/bash

# install virt-manager and related packages
sudo pacman -S --noconfirm --needed qemu-desktop virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat

# enable the service
sudo systemctl enable --now libvirtd
sudo systemctl start libvirtd

# Configure libvirt
sudo sed -i "s|^.*unix_sock_group.*$|unix_sock_group="libvirt"|" /etc/libvirt/libvirtd.conf
sudo sed -i "s|^.*unix_sock_rw_perms.*$|unix_sock_rw_perms="0770"|" /etc/libvirt/libvirtd.conf
sudo sed -i "s|^.*unix_sock_ro_perms.*$|unix_sock_ro_perms="0777"|" /etc/libvirt/libvirtd.conf

# Add current user to libvirt group
sudo usermod -aG libvirt $(whoami)

# download and install the latest version of virtio-win
if [ ! -f "/mnt/storage/virtio-win/virtio-win.iso" ]; then
  sudo mkdir -p /usr/share/virtio-win
  curl -i https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso -o /mnt/storage/virtio-win/virtio-win.iso
  echo "VirtIO drivers mounted successfully."
fi
