#!/bin/bash

echo "Installing ZSH..."
sudo pacman -S --noconfirm --needed zsh

echo "Setting ZSH as default shell..."
chsh -s $(which zsh)
echo "ZSH installed and set as default shell."

echo "Installing Oh-My-ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Oh-My-ZSH installed."

echo "Installing ZSH plugins: (zsh-autosuggestions, zsh-syntax-highlighting, zsh-completions, z)..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

echo "Installing Powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
