#!/bin/bash

# Temporary directory to clone the repository
temp_dir="/tmp/ibm-licensing-bundle"

# Clean up the temporary directory
rm -rf "$temp_dir"

# Remote repository URL
remote_repo="git@github.ibm.com:cloud-license-reporter/ibm-licensing-bundle.git"

# Clone the repository into the temporary directory
git clone "$remote_repo" "$temp_dir"

# Change to the cloned repository directory
cd "$temp_dir"

git config user.name "Bedrock Bedrock Installer FID"
git config user.email "bedrock.installer.fid@ibm.com"

for branch in master; do
    # Checkout the branch
    git checkout "$branch"

    # Pull the latest code
    git pull origin "$branch"

    # Update the submodule
    git submodule update --init --recursive
    git submodule update --remote submodules/installer_scripts

    # Check if the submodule has been updated
    if [[ $(git submodule status submodules/installer_scripts) == *"+"* ]]; then
        timestamp=$(date +"%Y-%m-%d-%H-%M")
        # Submodule has been updated, perform Git operations
        git add .
        git commit -m "installer-automation-$timestamp"
        git push origin "$branch"
    fi
done

# Clean up the temporary directory
rm -rf "$temp_dir"
