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

```bash
sudo snap install chezmoi --classic
chezmoi init --apply git@github.com:Rokkit-exe/dotfiles.git
```

# Usage

```bash
# Update dotfiles
chezmoi update
# Add new dotfiles
chezmoi add <path/to/file>
# Remove dotfiles
chezmoi forget <path/to/file>
# View diff of dotfiles
chezmoi diff
# Apply changes to dotfiles
chezmoi apply
```
