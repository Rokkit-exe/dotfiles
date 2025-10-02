#!/usr/bin/env bash
set -euo pipefail

WORKDIR="$HOME/Downloads"
DOWNLOAD_PAGE="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.35.5-stable.tar.xz"
NAME='flutter_linux_*-stable.tar.xz' # pattern

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa

mkdir -p "$WORKDIR"

# Use remote name and save into WORKDIR
curl -L --output-dir "$WORKDIR" -O "$DOWNLOAD_PAGE"

# Resolve the archive from the pattern
shopt -s nullglob
matches=("$WORKDIR"/$NAME)
shopt -u nullglob
if [ ${#matches[@]} -eq 0 ]; then
  echo "No file matched: $WORKDIR/$NAME" >&2
  exit 1
fi
ARCHIVE="${matches[0]}"

# Extract
tar -xJf "$ARCHIVE" -C "$WORKDIR"

if [ -d $WORKDIR/flutter ]; then
  mv $WORKDIR/flutter $HOME/flutter
  echo 'export PATH="$HOME/flutter/bin:$PATH"' >>~/.zshrc
fi
