# Tools

What's installed and how to use it.

## Development Tools

### Version Control

**git** - Version control
- Custom aliases (see [git-aliases.md](./git-aliases.md))
- `zdiff3` conflict style
- `histogram` diff algorithm

**gh** - GitHub CLI
```bash
gh repo create          # Create repository
gh pr create            # Create pull request
gh pr list              # List PRs
gh issue create         # Create issue
gh repo view            # View repository
```

**git-absorb** - Automatic fixup commits
```bash
# Make changes to existing code
git add changed_file.js
git absorb                      # Creates fixup commits automatically
git rebase -i --autosquash main # Squash them in
```

Auto fixup commits via git blame.

### Language Version Managers

**fnm** - Fast Node Manager
- 20x faster than nvm
- Auto-switches with `.node-version` or `.nvmrc`

```bash
fnm install 20          # Install Node 20
fnm use 20              # Use Node 20
fnm default 20          # Set default
fnm list                # List versions
```

### Python Tools

**ruff** - Fast Python linter and formatter
- Written in Rust (100x faster than black/flake8)
- Replaces: black, isort, flake8, pylint

**uv** - Fast Python package manager
- Rust-based pip replacement
- Handles virtualenvs

**ty** - Python type checker
- Fast and minimal

### Environment Management

**direnv** - Directory-based environment variables
- Loads `.envrc` when entering directories
- Unloads when leaving
- Per-project config

```bash
# In project directory
echo 'export DATABASE_URL=postgres://localhost/mydb' > .envrc
direnv allow            # Must allow each .envrc file
```

## CLI Tools

### File Operations

**eza** - Replacement for `ls`
```bash
eza                     # Colorized list with icons
eza -l                  # Long format
eza -la                 # Include hidden files
eza --tree              # Tree view
eza --git               # Show git status
```

**fd** - Replacement for `find`
```bash
fd pattern              # Find files/directories
fd -e js                # Find by extension
fd -H pattern           # Include hidden files
fd -E node_modules      # Exclude directory
```

**bat** - Replacement for `cat`
```bash
bat file.txt            # Syntax highlighting, line numbers
bat -n file.txt         # Show line numbers
bat --plain file.txt    # No decorations
bat file1 file2         # Multiple files
```

**zoxide** - Directory jumper
```bash
z project               # Jump to directory
zi                      # Interactive selection
z -l project            # List matches
```

Learns where you go. Fuzzy matching included.

### Search

**ripgrep (rg)** - Fast recursive search
```bash
rg pattern              # Search current directory
rg -i pattern           # Case insensitive
rg -t js pattern        # Only JavaScript files
rg -C 3 pattern         # 3 lines of context
rg --files-with-matches # Just filenames
rg -A 5 pattern         # Show 5 lines after match
```

Respects `.gitignore` by default, includes regex support.

**fzf** - Fuzzy finder
```bash
# Pipe any list to fzf
ls | fzf
git branch | fzf
history | fzf

# Ctrl+r in shell uses fzf (via Atuin)
# Ctrl+t for file search
```

**jq** - JSON processor
```bash
jq . file.json                    # Pretty print
jq '.key' file.json               # Extract value
jq '.items[] | .name' file.json   # Map and extract
echo '{"a":1}' | jq '.a'          # Pipe JSON
```

### Terminal

**kitty** - GPU-accelerated terminal emulator
```bash
# Keyboard shortcuts
CMD+D                  # Split window
CMD+K                  # Clear terminal
CMD+T                  # New tab
CMD+W                  # Close tab
CMD+Shift+R            # Reload config
CMD+Shift+.            # Increase transparency
CMD+Shift+,            # Decrease transparency
```

Features: transparency, background blur, CMD+click URLs, Dracula theme.

**Zellij** - Terminal multiplexer
- Better than tmux/screen
- Session management built-in
- See [terminal-guide.md](./terminal-guide.md)

**Starship** - Shell prompt
- Fast (Rust)
- Shows git status, language versions, timing
- Async

**Atuin** - Shell history
- SQLite-backed
- Fuzzy search
- No cloud sync
- Context-aware

### Git Helpers

**delta** - Syntax-highlighting pager for git
- Integrated with git diff/log
- Side-by-side diffs
- Readable merge conflicts
- Line numbers

**tig** - Text-mode interface for git
```bash
tig                     # Repository browser
tig status              # Status view
tig blame file.txt      # Blame view
tig log                 # Log view
```

## System Tools

### Package Management

**Homebrew** - macOS package manager
```bash
brew install package    # Install package
brew uninstall package  # Remove package
brew update             # Update package list
brew upgrade            # Upgrade all packages
brew list               # List installed packages
brew search term        # Search for packages
brew info package       # Package information
```

**mas** - Mac App Store CLI
```bash
mas list                # List installed apps
mas search "App Name"   # Search Mac App Store
mas install 497799835   # Install by ID
mas upgrade             # Upgrade all apps
```

### Compression

**7zip** - High compression file archiver
**xz** - LZMA compression
**zstd** - Fast compression algorithm

### Network Tools

**httpie** - HTTP client (better than curl)
```bash
http GET https://api.example.com
http POST https://api.example.com key=value
http --auth user:pass GET https://api.example.com
```

**wget** - File downloader
```bash
wget https://example.com/file.zip
wget -O output.zip https://example.com/file.zip
wget -c https://example.com/file.zip  # Resume
```

### System Monitoring

**ncdu** - Disk usage analyzer
```bash
ncdu                    # Analyze current directory
ncdu /path              # Analyze specific path
```
Interactive TUI for finding what's using disk space.

## Security Tools

**age** - File encryption
```bash
age -r recipient.txt -o encrypted.age file.txt
age -d -i key.txt encrypted.age > file.txt
```
Used to encrypt SSH keys and ticker config in dotfiles.

**gnupg** - PGP encryption and signing
**openssh** - SSH client and server

## Development Applications

### Editors & IDEs

**Zed** - Fast code editor
**PyCharm** - Python IDE

### Browsers

**Arc** - Browser with workspaces
**Chrome** - Browser with dev tools

### Productivity

**Raycast** - Spotlight replacement
- Quick launcher
- Clipboard history
- Window management (Hyper Key + vim keys)
- Extensions

**ticker** - Terminal stock/crypto tracker
```bash
ticker                     # Run with config
ticker -w "AAPL,MSFT"      # Watch specific symbols
ticker print               # Export holdings

# While running
TAB                        # Next group
Shift+TAB                  # Previous group
q                          # Quit
```

Tracks positions, shows P&L, supports multiple watchlist groups. Config encrypted in dotfiles.

## Fonts

**JetBrains Mono Nerd Font** - Monospace font with ligatures and icons

## Tool Categories Summary

| Category | Tools |
|----------|-------|
| **Shell** | Zsh, Starship, Atuin, Zellij |
| **Terminal** | kitty |
| **Files** | eza, bat, fd, zoxide, ncdu |
| **Search** | ripgrep, fzf, jq |
| **Git** | git, gh, git-absorb, delta, tig |
| **Languages** | fnm (Node) |
| **Python** | ruff, uv, ty |
| **Editors** | Zed, PyCharm |
| **Productivity** | Raycast, ticker |
| **Network** | httpie, wget |
| **Security** | age, gnupg, openssh |

## Configuration Locations

```
~/.config/starship.toml          # Starship prompt
~/.config/atuin/config.toml      # Atuin history
~/.config/zellij/config.kdl      # Zellij multiplexer
~/.config/kitty/kitty.conf       # kitty terminal
~/.config/bat/config             # Bat viewer
~/.ticker.yaml                   # ticker (encrypted in repo)
~/.gitconfig                     # Git configuration
~/.zshrc                         # Zsh shell
~/.ssh/config                    # SSH configuration
```

## Learning Resources

```bash
man <tool>              # Manual
<tool> --help           # Help
tldr <tool>             # Examples (brew install tldr)
```

Links:
- [Modern Unix](https://github.com/ibraheemdev/modern-unix) - CLI tools list
- [awesome-shell](https://github.com/alebcay/awesome-shell) - Shell stuff
- [Command Line Power User](https://commandlinepoweruser.com/) - Video course
