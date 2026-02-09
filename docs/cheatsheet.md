# Cheatsheet

Quick reference for daily use.

## Chezmoi

```bash
chezmoi edit ~/.zshrc      # Edit file
chezmoi diff               # See changes
chezmoi apply              # Apply changes
chezmoi update             # Pull and apply from GitHub
chezmoi add ~/.newfile     # Track new file
chezmoi add --encrypt ~/.ssh/key  # Track encrypted
```

## Shell Aliases

```bash
# Files
ls / ll / lt               # List (eza)
cat file                   # View (bat)
z project                  # Jump to dir (zoxide)

# Git
git st                     # Status
git lg                     # Graph log
git last                   # Last commit
git undo                   # Undo commit (keep changes)
git absorb                 # Auto fixup commits
git gone                   # Delete merged branches

# Zellij
zj                         # Start
zja name                   # Attach
zjl                        # List sessions
Ctrl+p                     # Pane mode
Ctrl+t                     # Tab mode

# kitty
CMD+D                      # Split window
CMD+K                      # Clear terminal
CMD+T                      # New tab
CMD+W                      # Close tab
CMD+Shift+R                # Reload config

# Search
Ctrl+r                     # History (Atuin)
rg pattern                 # Find in files
fd pattern                 # Find files
```

## Node & Python

```bash
# Node
fnm install 20             # Install Node
fnm use 20                 # Switch version
fnm default 20             # Set default

# Python
uv venv                    # Create virtualenv
uv pip install pkg         # Install package
ruff check .               # Lint
ruff format .              # Format
ty .                       # Type check
```

## SSH

```bash
# Generate key
ssh-keygen -t ed25519 -C "email - desc"

# Add to chezmoi
chezmoi add --encrypt ~/.ssh/key
chezmoi add ~/.ssh/key.pub
```

## Brew

```bash
brew install pkg           # Install
brew uninstall pkg         # Remove
brew upgrade               # Update all

# Update Brewfile
cd ~/.local/share/chezmoi
brew bundle dump --describe --force
```

## Market Trackers

### ticker (Dashboard Style)

```bash
ticker                     # Run with config
ticker -w "AAPL,MSFT"      # Watch specific symbols
ticker print               # Export holdings to stdout
ticker print > holdings.csv # Export to CSV

# While running
TAB                        # Next group
Shift+TAB                  # Previous group
q                          # Quit
```

### tickrs (Charts & Graphs)

```bash
tickrs                     # Run with config
tickrs -s AAPL,MSFT        # Watch specific symbols
tickrs -t 1W               # Set time frame (1D/1W/1M/3M/6M/1Y/5Y)
tickrs --show-volumes      # Show volume graphs
tickrs --summary           # Summary view

# While running
a                          # Add stock
d                          # Remove stock
s                          # Change time frame
Tab                        # Cycle panes
?                          # Help
```

## Raycast (Window Management)

```bash
# Caps Lock = Hyper Key (⌃⌥⇧⌘)
Caps Lock + H              # Left half
Caps Lock + J              # Bottom half
Caps Lock + K              # Top half
Caps Lock + L              # Right half
Caps Lock + M              # Maximize
Caps Lock + F              # Fullscreen
Caps Lock + 1/2/3/4        # Quarters or displays
```

## macOS Native Window Tiling

```bash
Fn + Control + F           # Fill (maximize)
Fn + Control + C           # Center
Fn + Control + R           # Return to previous size
Fn + Control + ←/→         # Left/Right half
Fn + Control + ↑/↓         # Top/Bottom half
```

## macOS Settings Applied

- Fast key repeat
- Show hidden files
- Show file extensions
- No auto-correct
- Expanded save dialogs

## Keyboard Shortcuts

| Action | Key |
|--------|-----|
| History search | `Ctrl+r` |
| Zellij pane | `Ctrl+p` |
| Zellij tab | `Ctrl+t` |
| Zellij move | `Ctrl+h` |
| Clear screen | `Ctrl+l` |
| Start of line | `Ctrl+a` |
| End of line | `Ctrl+e` |
| Delete word | `Ctrl+w` |

## Files & Locations

```
~/.config/starship.toml          # Prompt
~/.config/atuin/config.toml      # History
~/.config/bat/config             # Syntax highlighting
~/.config/kitty/kitty.conf       # Terminal
~/.ticker.yaml                   # Market tracker
~/.gitconfig                     # Git
~/.ssh/config                    # SSH
~/.zshrc                         # Shell
~/.config/chezmoi/key.txt        # Encryption key (BACKUP THIS!)
```

## When Things Break

```bash
# SSH keys not working
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_*
ssh-add ~/.ssh/your_key

# Path issues
source ~/.zprofile
source ~/.zshrc

# Homebrew issues
brew doctor
brew update && brew upgrade
```
