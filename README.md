# 🏠 nulloxide's Dotfiles

Dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Features

- **Shell**: Zsh with [Starship](https://starship.rs/) prompt
- **Terminal Multiplexer**: [Zellij](https://zellij.dev/) with session persistence
- **Shell History**: [Atuin](https://atuin.sh/) with fuzzy search (no cloud sync)
- **Node Version Manager**: [fnm](https://github.com/Schniz/fnm) - 20x faster than nvm
- **CLI Tools**: `eza`, `bat`, `fd`, `ripgrep`, `zoxide`, `delta`
- **Git**: Custom aliases and `git-absorb` integration
- **SSH**: Ed25519 keys with connection multiplexing
- **Encryption**: SSH keys encrypted with [age](https://github.com/FiloSottile/age)

## 🚀 Quick Start

### Fresh Install (New Machine)

Install chezmoi and apply dotfiles in one command:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply nulloxide
```

Installs everything. Homebrew, packages, settings, the works.

### Existing chezmoi Installation

```bash
chezmoi init --apply nulloxide
```

## 📦 What's Installed

See [Brewfile](./Brewfile) for the complete list of packages and applications.

**Highlights:**
- Development: git, gh, git-absorb, fnm, direnv
- CLI: eza, bat, fd, ripgrep, zoxide, delta
- Terminal: zellij, starship, atuin
- Apps: kitty, Arc, Raycast, PyCharm, Zed

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

## 🛠️ Maintenance

```bash
# Update Brewfile after installing new packages
cd ~/.local/share/chezmoi
brew bundle dump --describe --force

# Update packages
brew update && brew upgrade
```

## License

MIT - Use it, break it, fix it, trash it.
