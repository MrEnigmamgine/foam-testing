#!/bin/bash

repo=$(echo "$GITHUB_REPOSITORY" | cut -d'/' -f2)

cd "/workspaces/$repo" || exit
git pull
git add .

# Check if there are changes staged
if ! git diff --cached --exit-code; then
    git commit -m "Automatic commit $(date)"
    git push
else
    echo "No changes"
fi
