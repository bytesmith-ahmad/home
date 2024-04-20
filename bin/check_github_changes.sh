#!/bin/bash

# Define your GitHub repository URL
github_repo="$github/home"

# Check for changes in the remote repository
git remote update > /dev/null 2>&1

# Check if there are any changes
if git status -uno | grep -q 'Your branch is behind'; then
    # Changes found, prompt the user
    read -p "Found changes in the remote repository. Do you want to pull? (Y/N): " answer
    if [[ "$answer" =~ ^[Yy]$ ]]; then
        # User confirmed, pull changes
        git pull "$github_repo"
        reset
    else
        echo "Changes not pulled."
    fi
else
    echo "No changes found in the remote repository."
fi

#track me!
