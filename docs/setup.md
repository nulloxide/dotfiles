# Setup

How things work and basic configuration.

## Fresh Install

One command installs everything:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply nulloxide
```

Installs Homebrew, packages, settings. Done.

## What Gets Changed

### macOS Settings

Fast key repeat, show hidden files/extensions, no autocorrect, expanded dialogs, Finder bars.

Log out/in for changes to take effect.

### SSH Config

Location: `~/.ssh/config`

Features:
- Ed25519 keys (modern crypto)
- Connection multiplexing (reuse connections)
- 10-minute keep-alive

Keys are encrypted with age in the repo.

### Git Config

Location: `~/.gitconfig`

Includes:
- Custom aliases (see [git-aliases.md](./git-aliases.md))
- zdiff3 conflict style
- histogram diff algorithm
- delta for prettier diffs

## Adding New Machines

```bash
# On new machine
chezmoi init --apply nulloxide

# Enter encryption key when prompted
# (you backed it up, right?)
```

## Making Changes

```bash
# Edit through chezmoi
chezmoi edit ~/.zshrc

# Or edit in repo
cd ~/.local/share/chezmoi
# Edit files, then:
git commit -m "stuff"
git push
chezmoi apply
```

## Adding Files

```bash
# Regular files
chezmoi add ~/.config/newapp/config.toml

# Encrypted files (SSH keys, secrets)
chezmoi add --encrypt ~/.ssh/new_key

# Update Brewfile after installing packages
cd ~/.local/share/chezmoi
brew bundle dump --describe --force
```

## Encryption

SSH keys and ticker config encrypted with age. Encryption key: `~/.config/chezmoi/key.txt`

**BACKUP THIS KEY OR SUFFER**. Without it, your encrypted files are gone forever.

**Encrypted files:**
- `~/.ssh/id_ed25519` (SSH key)
- `~/.ssh/devdroid_ed25519` (SSH key)
- `~/.ticker.yaml` (market positions - ticker)
- `~/Library/Application Support/tickrs/config.yml` (market positions - tickrs)

```bash
# View key (save somewhere safe)
cat ~/.config/chezmoi/key.txt
```

## Bootstrap Scripts

Scripts in `.chezmoiscripts/` handle Homebrew install, package updates, and macOS settings.

## Updating

```bash
# Pull latest from GitHub and apply
chezmoi update

# Or manually
cd ~/.local/share/chezmoi
git pull
chezmoi apply
```

## Checking Status

```bash
chezmoi diff      # See what's different
chezmoi status    # See what would change
```

## Config Files Location

```
~/.config/starship.toml       # Prompt
~/.config/atuin/config.toml   # History
~/.config/bat/config          # Syntax highlighting
~/.config/kitty/kitty.conf    # Terminal
~/.config/zellij/config.kdl   # Multiplexer
~/.ticker.yaml                # Market tracker (encrypted in repo)
~/.gitconfig                  # Git
~/.ssh/config                 # SSH
~/.zshrc                      # Shell
```

## See Also

- [Cheatsheet](./cheatsheet.md) - Quick reference
- [Troubleshooting](./troubleshooting.md) - When things break
- [Why These Tools?](./why.md) - Tool choices explained
