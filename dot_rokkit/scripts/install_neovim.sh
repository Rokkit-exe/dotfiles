#!/usr/bin/env bash
set -Eeuo pipefail

# Config
URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
INSTALL_DIR="/opt/nvim"        # final location
BIN_LINK="/usr/local/bin/nvim" # stable symlink
ZSHRC="${ZDOTDIR:-$HOME}/.zshrc"

require() { command -v "$1" >/dev/null 2>&1 || {
  echo "Missing: $1" >&2
  exit 1
}; }

# Preflight
require curl
require tar
sudo -v

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

tarball="$tmpdir/nvim.tar.gz"

echo "→ Downloading Neovim to $tarball"
curl -fL --retry 3 --retry-delay 2 -o "$tarball" "$URL"

echo "→ Removing previous installs under /opt"
# Keep a backup of the main folder if present
if [ -d "$INSTALL_DIR" ]; then
  sudo mv "$INSTALL_DIR" "${INSTALL_DIR}.bak-$(date +%Y%m%d-%H%M%S)"
fi
# Remove any legacy folder name if present
sudo rm -rf /opt/nvim-linux-x86_64

echo "→ Extracting to /opt"
sudo tar -C /opt -xzf "$tarball"
sudo mv /opt/nvim-linux-x86_64 "$INSTALL_DIR"

echo "→ Creating/refreshing symlink $BIN_LINK → $INSTALL_DIR/bin/nvim"
sudo install -d "$(dirname "$BIN_LINK")"
sudo ln -sfn "$INSTALL_DIR/bin/nvim" "$BIN_LINK"

# Optional: clean up PATH duplicates in .zshrc from older setups
if [ -f "$ZSHRC" ]; then
  echo "→ Cleaning old Neovim PATH lines in $ZSHRC"
  cp -f "$ZSHRC" "$ZSHRC.bak.$(date +%Y%m%d-%H%M%S)"
  # Remove any lines that added /opt/nvim*/bin to PATH
  sed -i -E '/\/opt\/nvim(-linux[_-]x86_64)?\/bin/d' "$ZSHRC"
  # Remove any previous managed block
  sed -i '/# >>> NVIM PATH >>>/,/# <<< NVIM PATH <<</d' "$ZSHRC"
  # (No need to add a new PATH line because we symlinked into /usr/local/bin)
fi

echo "✔ Neovim installed: $("$BIN_LINK" --version | head -n1)"
echo "Tip: if your shell doesn’t see it, open a new terminal or run: hash -r"
