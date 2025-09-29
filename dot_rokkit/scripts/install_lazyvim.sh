#!/bin/bash

echo "🔍 Checking for LazyVim..."

# Path to Neovim config
NVIM_DIR="$HOME/.config/nvim"

# Check if LazyVim appears to be installed
if [[ -f "$NVIM_DIR/lazy-lock.json" && -d "$NVIM_DIR/lua" && -f "$NVIM_DIR/init.lua" ]]; then
  echo "✅ LazyVim already installed at $NVIM_DIR"
else
  echo "🚀 Installing LazyVim..."
  git clone https://github.com/LazyVim/starter "$NVIM_DIR"
  rm -rf "$NVIM_DIR/.git"
  echo "✅ LazyVim installed to $NVIM_DIR"
fi

