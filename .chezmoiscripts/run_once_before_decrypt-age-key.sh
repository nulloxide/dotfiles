#!/bin/bash
# Decrypt age private key on first run
# This runs before any encrypted files are applied

set -e

KEY_PATH="${HOME}/.config/chezmoi/key.txt"
ENCRYPTED_KEY="${HOME}/.local/share/chezmoi/key.txt.age"

if [ -f "$KEY_PATH" ]; then
    echo "✓ Age key already exists"
    exit 0
fi

if [ ! -f "$ENCRYPTED_KEY" ]; then
    echo "✗ Encrypted key not found at $ENCRYPTED_KEY"
    exit 1
fi

echo "Decrypting age key (enter passphrase)..."
mkdir -p "$(dirname "$KEY_PATH")"
age --decrypt --output "$KEY_PATH" "$ENCRYPTED_KEY"
chmod 600 "$KEY_PATH"
echo "✓ Age key decrypted"
