#!/bin/bash

# re-add all tracked config and update origin
#
chezmoi cd

echo "re-adding all tracked files"
chezmoi re-add "$(chezmoi list)"

git add .

# get the date
date=$(date +"%Y-%m-%d %T")
git commit -m "re-add all tracked configs on $date"

git push origin main || {
  echo "unable to push to origin"
  exit 1
}

echo "sucessfully pushed to origin"

