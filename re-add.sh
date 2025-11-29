#!/bin/bash

# re-add all tracked config and update origin
#
chezmoi cd

chezmoi re-add "$(chezmoi list)"

git add .

# get the date
date=$(date +"%Y-%m-%d %T")
git commit -m "re-add all tracked configs on $date"

git push origin main


