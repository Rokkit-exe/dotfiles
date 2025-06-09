# Rokkit's Dotfiles using chezmoi


# Installation

```bash
sudo pacman -S chezmoi
chezmoi init --apply git@github.com:Rokkit-exe/dotfiles.git
```

# Usage
```bash
# Update dotfiles
chezmoi update
# Add new dotfiles
chezmoi add <path/to/file>
# Remove dotfiles
chezmoi remove <path/to/file>
# View diff of dotfiles
chezmoi diff
# Apply changes to dotfiles
chezmoi apply
```

