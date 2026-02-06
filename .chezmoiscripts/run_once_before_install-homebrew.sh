#!/bin/bash
# Install Homebrew if not already installed
# This runs once before other scripts

set -e

echo "Checking for Homebrew..."

if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == 'arm64' ]]; then
        echo "Adding Homebrew to PATH..."
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    echo "✓ Homebrew installed successfully"
else
    echo "✓ Homebrew already installed"
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update
echo "✓ Homebrew updated"
