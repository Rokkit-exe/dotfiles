#!/bin/bash

# Ensure we exit immediately if a command fails
set -e

echo "Re-adding all modified tracked files..."
# Run from home to ensure path resolution is clean
cd "$HOME"

# This native command replaces the need to manually list or pass flags
chezmoi re-add

# Safely move into the source directory to handle the git operations
cd "$(chezmoi source-path)"

echo "Staging changes in git..."
git add .

# Get the current date and time
current_date=$(date +"%Y-%m-%d %T")

# Commit and push
if git commit -m "re-add all tracked configs on $current_date"; then
    echo "Pushing to origin..."
    git push origin main
    echo "Successfully pushed to origin."
else
    echo "No changes to commit."
fi
