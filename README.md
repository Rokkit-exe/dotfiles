# dotfiles

Here are my dotfiles for various applications and environments like:

- zshrc
- kitty
- hyprland (waybar, hyprpaper, hyprlock, hypridle, swaync, wofi)
- nvim

## Usage

Using `stow` to symlink the files in the `dotfiles` directory to the appropriate locations in your home directory.
This allows you to easily manage and update your dotfiles without cluttering your home directory with multiple copies of the same file.

```bash
sudo pacman -S stow
cd dotfiles
stow -t ~ <appname>
```
