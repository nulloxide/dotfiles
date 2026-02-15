#!/bin/sh
# Bootstrap dotfiles for any machine
# Owner: prompted for age passphrase, gets full setup with secrets
# Public: skips passphrase, gets configs without secrets
#
# Usage: curl -fsLS https://raw.githubusercontent.com/nulloxide/dotfiles/main/install.sh | sh

set -e

REPO="nulloxide"
KEY_PATH="${HOME}/.config/chezmoi/key.txt"
BIN_DIR="${HOME}/.local/bin"
SOURCE_DIR="${HOME}/.local/share/chezmoi"

# Install chezmoi
if ! command -v chezmoi > /dev/null 2>&1; then
    echo "Installing chezmoi..."
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "${BIN_DIR}"
fi
export PATH="${BIN_DIR}:${PATH}"

# Install Homebrew if not present (macOS)
if [ "$(uname)" = "Darwin" ] && ! command -v brew > /dev/null 2>&1; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [ "$(uname -m)" = "arm64" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# Install age (needed for key decryption)
if ! command -v age > /dev/null 2>&1; then
    if command -v brew > /dev/null 2>&1; then
        brew install age
    else
        echo "Warning: age not available, encrypted files will be skipped"
    fi
fi

# Attempt age key decryption before chezmoi init
# This way chezmoi can detect owner status via key.txt existence
ENCRYPTED_KEY="${SOURCE_DIR}/key.txt.age"

# Clone repo first to get the encrypted key file
echo "Cloning dotfiles..."
chezmoi init "${REPO}"

if [ ! -f "${KEY_PATH}" ] && [ -f "${ENCRYPTED_KEY}" ] && command -v age > /dev/null 2>&1; then
    echo ""
    echo "Enter age key passphrase to unlock secrets."
    echo "Press Ctrl+C to skip (public user mode)."
    echo ""
    mkdir -p "$(dirname "${KEY_PATH}")"
    # Run in a subshell so Ctrl+C only kills age, not the entire script
    (age --decrypt --output "${KEY_PATH}" "${ENCRYPTED_KEY}" 2>/dev/null) || true
    if [ -f "${KEY_PATH}" ] && [ -s "${KEY_PATH}" ]; then
        chmod 600 "${KEY_PATH}"
        echo "Age key decrypted"
    else
        rm -f "${KEY_PATH}"
        echo "Continuing without secrets (public user mode)"
    fi
fi

# Apply (re-init to render config with correct isOwner)
echo "Applying dotfiles..."
chezmoi init --apply "${REPO}"

echo ""
echo "Done! Restart your shell."
