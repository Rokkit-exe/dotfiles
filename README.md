# Rokkit's Dotfiles using chezmoi

# Installation

### Auth

```bash
# generate ssh key for github
ssh-keygen

# copy the public key and place it in github sshkey
cat $HOME/.ssh/id_ed25519.pub
```

### Arch Linux

```bash
sudo pacman -S chezmoi
chezmoi init --apply git@github.com:Rokkit-exe/dotfiles.git
```

# Usage

```bash
# Apply remote changes to local system
chezmoi update
# Add new dotfiles to management
chezmoi add <path/to/file>
# Remove dotfiles from management
chezmoi forget <path/to/file>
# View diff of dotfiles
chezmoi diff
# Apply local chezmoi changes to the system
chezmoi apply
```
