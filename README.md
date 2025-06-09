# Rokkit's Dotfiles using chezmoi


# Installation

```bash
sudo pacman -S chezmoi
chezmoi init --apply git@github.com:Rokkit-exe/dotfiles.git
```

# Usage
```bash
# Update dotfiles
chezmoi Update
# Add new dotfiles
chezmoi add <path/to/file>
# Remove dotfiles
chezmoi remove <path/to/file>
# Edit dotfiles
chezmoi edit <path/to/file>
# View status of dotfiles
chezmoi status
# View diff of dotfiles
chezmoi diff
# Apply changes to dotfiles
chezmoi apply <path/to/file>
```

