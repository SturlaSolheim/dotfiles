#!/bin/bash

# Simple script to stow (or restow) all dotfiles folders
# Usage: ./stow-all.sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set the dotfiles directory (assuming script is in the dotfiles folder)
DOTFILES_DIR="$SCRIPT_DIR"

echo "Stowing all dotfiles from: $DOTFILES_DIR"
echo "Target directory: $HOME"
echo ""

# Change to dotfiles directory
cd "$DOTFILES_DIR" || {
    echo "Error: Cannot change to dotfiles directory: $DOTFILES_DIR"
    exit 1
}

# Counter for processed folders
count=0

# Loop through all directories in the dotfiles folder
for dir in */; do
    # Remove trailing slash
    folder="${dir%/}"
    
    # Skip if it's not a directory or if it starts with a dot
    if [[ ! -d "$folder" || "$folder" == .* ]]; then
        continue
    fi
    
    echo "Processing: $folder"
    
    # Use --restow to handle both new and existing packages
    if stow --restow "$folder"; then
        echo "✓ Successfully processed: $folder"
        ((count++))
    else
        echo "✗ Failed to process: $folder"
    fi
    echo ""
done

echo "Finished! Processed $count folders."
