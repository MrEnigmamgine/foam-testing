#!/bin/bash

# Change directory to the repo directory
repo=$(echo "$GITHUB_REPOSITORY" | cut -d'/' -f2)
cd "/workspaces/$repo" || exit

# Pull to avoid conflicts, then stage all changes.
git pull
git add .

# Check if there are changes staged and sync.
if ! git diff --cached --exit-code; then
    git commit -m "Automatic commit $(date)"
    git push
else
    echo "No changes"
fi
