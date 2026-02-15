# Bootstrap dotfiles for Windows (EXPERIMENTAL)
# Owner: prompted for age passphrase, gets full setup with secrets
# Public: skips passphrase, gets configs without secrets
#
# Usage: iex (iwr 'https://raw.githubusercontent.com/nulloxide/dotfiles/main/install.ps1').Content

$ErrorActionPreference = "Stop"

$REPO = "nulloxide"
$KEY_PATH = "$env:USERPROFILE\.config\chezmoi\key.txt"
$BIN_DIR = "$env:USERPROFILE\.local\bin"
$SOURCE_DIR = "$env:USERPROFILE\.local\share\chezmoi"

# Install Scoop if not present
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Scoop..."
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

# Install chezmoi
if (-not (Get-Command chezmoi -ErrorAction SilentlyContinue)) {
    Write-Host "Installing chezmoi..."
    scoop install chezmoi
}

# Install age (needed for key decryption)
if (-not (Get-Command age -ErrorAction SilentlyContinue)) {
    Write-Host "Installing age..."
    scoop install age
}

# Clone repo first to get the encrypted key file
Write-Host "Cloning dotfiles..."
chezmoi init $REPO

$ENCRYPTED_KEY = "$SOURCE_DIR\key.txt.age"

if ((-not (Test-Path $KEY_PATH)) -and (Test-Path $ENCRYPTED_KEY) -and (Get-Command age -ErrorAction SilentlyContinue)) {
    Write-Host ""
    $reply = Read-Host "Do you have the age key passphrase? (y/N)"
    if ($reply -eq "y" -or $reply -eq "Y") {
        $keyDir = Split-Path $KEY_PATH -Parent
        if (-not (Test-Path $keyDir)) {
            New-Item -ItemType Directory -Path $keyDir -Force | Out-Null
        }
        try {
            age --decrypt --output $KEY_PATH $ENCRYPTED_KEY
            if ((Test-Path $KEY_PATH) -and ((Get-Item $KEY_PATH).Length -gt 0)) {
                Write-Host "Age key decrypted"
            } else {
                Remove-Item $KEY_PATH -ErrorAction SilentlyContinue
                Write-Host "Decryption failed, continuing without secrets (public user mode)"
            }
        } catch {
            Remove-Item $KEY_PATH -ErrorAction SilentlyContinue
            Write-Host "Decryption failed, continuing without secrets (public user mode)"
        }
    } else {
        Write-Host "Continuing without secrets (public user mode)"
    }
}

# Apply (re-init to render config with correct isOwner)
Write-Host "Applying dotfiles..."
chezmoi init --apply $REPO

Write-Host ""
Write-Host "Done! Restart your shell."
