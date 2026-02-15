# 🏠 nulloxide's Dotfiles

Dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Features

- **Shell**: Zsh with [Starship](https://starship.rs/) prompt
- **Terminal Multiplexer**: [Zellij](https://zellij.dev/) with session persistence
- **Shell History**: [Atuin](https://atuin.sh/) with fuzzy search (no cloud sync)
- **Node Version Manager**: [fnm](https://github.com/Schniz/fnm) - 20x faster than nvm
- **CLI Tools**: `eza`, `bat`, `fd`, `ripgrep`, `zoxide`, `delta`, `just`, `sd`, `hyperfine`
- **Git**: Custom aliases, `git-absorb`, delta diffs
- **Editors**: VS Code, Zed, PyCharm
- **SSH**: Ed25519 keys with connection multiplexing
- **Encryption**: SSH keys encrypted with [age](https://github.com/FiloSottile/age)
- **Cross-platform**: macOS (Intel/ARM), Linux, and Windows (experimental)

## 🚀 Quick Start

### macOS / Linux

```bash
curl -fsLS https://raw.githubusercontent.com/nulloxide/dotfiles/main/install.sh | sh
```

### Windows (Experimental)

```powershell
iex (iwr 'https://raw.githubusercontent.com/nulloxide/dotfiles/main/install.ps1').Content
```

- **Owner**: enter age passphrase when prompted to unlock SSH keys and secrets
- **Public user**: press Enter or Ctrl+C at the passphrase prompt to skip secrets

| Platform | Package Manager | What's Installed |
|----------|-----------------|------------------|
| macOS | Homebrew | Full Brewfile + casks + App Store apps |
| Linux | Homebrew | Brewfile (CLI tools only) |
| Windows | Scoop | Scoopfile (CLI tools, experimental) |

### Existing Installation

```bash
chezmoi update
```

## 📦 What's Installed

See [Brewfile](./Brewfile) (macOS/Linux) or [Scoopfile](./Scoopfile) (Windows) for the complete list.

**Highlights:**
- Development: git, gh, git-absorb, fnm, direnv, just
- CLI: eza, bat, fd, ripgrep, zoxide, delta, sd, hyperfine, ouch
- Network: httpie, doggo, trippy, iperf3, speedtest
- Terminal: zellij, starship, atuin, kitty
- Apps: VS Code, Zed, PyCharm, Arc, Raycast

## Documentation

- [Cheatsheet](./docs/cheatsheet.md) - Quick reference (start here)
- [Setup](./docs/setup.md) - How things work
- [Git Aliases](./docs/git-aliases.md) - Custom git shortcuts
- [Terminal Guide](./docs/terminal-guide.md) - Using the terminal
- [Tools](./docs/tools.md) - What's installed and why
- [Why?](./docs/why.md) - Tool choices explained
- [Troubleshooting](./docs/troubleshooting.md) - When things break

## 🔐 Encryption

SSH private keys are encrypted using [age](https://github.com/FiloSottile/age). The encryption key is stored at `~/.config/chezmoi/key.txt`.

**⚠️ Backup your key or cry later**. Without it, your SSH keys are gone forever.

```bash
# View your encryption key (save this somewhere safe)
cat ~/.config/chezmoi/key.txt
```

## 🔄 Daily Usage

```bash
# Edit a dotfile
chezmoi edit ~/.zshrc

# See what would change
chezmoi diff

# Apply changes
chezmoi apply

# Add a new file
chezmoi add ~/.newfile

# Add an encrypted file
chezmoi add --encrypt ~/.ssh/new_key

# Update from GitHub
chezmoi update

# Check status
chezmoi status
```

## 🛠️ How It Works

- **Dotfiles**: Managed by chezmoi with Go templates (`.tmpl` files)
- **Packages**: Brewfile installed via `run_onchange` script
- **Zsh Plugins**: Oh-My-Zsh + plugins managed via `.chezmoiexternal.toml` (auto-downloaded)
- **Secrets**: Encrypted with age, protected by `[add] secrets = "error"`

## 🛠️ Maintenance

### macOS / Linux
```bash
# Update Brewfile after installing new packages
cd ~/.local/share/chezmoi
brew bundle dump --describe --force

# Update packages
brew update && brew upgrade
```

### Windows
```powershell
# Update all Scoop packages
scoop update *

# Cleanup old versions
scoop cleanup *
```

> **Note**: Windows support is experimental. Some features may not work as expected.

## License

MIT - Use it, break it, fix it, trash it.
