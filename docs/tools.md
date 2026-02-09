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

**lazygit** - Terminal UI for git
```bash
lazygit                 # Interactive git TUI
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

**ouch** - Painless compression and decompression
```bash
ouch compress file1 file2 archive.tar.gz   # Compress
ouch decompress archive.tar.gz             # Decompress
ouch list archive.zip                      # List contents
```
Automatically detects format. Supports tar, gz, bz2, xz, zstd, zip, 7z.

### Network Tools

**httpie** - HTTP client (better than curl)
```bash
http GET https://api.example.com
http POST https://api.example.com key=value
http --auth user:pass GET https://api.example.com
```

**doggo** - Modern DNS client
```bash
doggo example.com                    # DNS lookup
doggo example.com MX                 # Query specific type
doggo example.com --nameserver 8.8.8.8  # Use specific resolver
```

**trippy** - Network diagnostic (traceroute + ping)
```bash
trip example.com                     # Trace route with live stats
```

**iperf3** - Network bandwidth measurement
```bash
iperf3 -s                            # Start server
iperf3 -c server-ip                  # Test bandwidth
```

**speedtest** - Ookla CLI
```bash
speedtest                            # Run speed test
```

**wget** - File downloader
```bash
wget https://example.com/file.zip
wget -O output.zip https://example.com/file.zip
wget -c https://example.com/file.zip  # Resume
```

### System Monitoring

**btop** - Resource monitor
**dust** - Disk usage analyzer (du alternative)
```bash
dust                    # Analyze current directory
dust /path              # Analyze specific path
```

**duf** - Disk free utility (df alternative)
```bash
duf                     # Show disk usage
```

**procs** - Modern ps replacement
```bash
procs                   # List processes
procs rust              # Filter by keyword
```

### Task Running & Benchmarking

**just** - Project-specific task runner
```bash
just                    # Run default recipe
just build              # Run named recipe
just --list             # List recipes
```

**hyperfine** - CLI benchmarking
```bash
hyperfine 'fd pattern'                # Benchmark command
hyperfine 'fd pattern' 'find . -name pattern'  # Compare commands
```

**sd** - Find and replace (sed alternative)
```bash
sd 'old' 'new' file.txt              # Replace in file
sd -F 'literal' 'new' file.txt       # Literal match
echo 'hello' | sd 'hello' 'world'    # Pipe
```

**tlrc** - Simplified man pages
```bash
tldr tar                # Show examples for tar
tldr git-rebase         # Show examples for git rebase
```

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

**VS Code** - Extensions, remote dev, debugging
**Zed** - Fast code editor (Rust-based)
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

**ticker** - Terminal stock/crypto tracker (dashboard style)
```bash
ticker                     # Run with config
ticker -w "AAPL,MSFT"      # Watch specific symbols
ticker print               # Export holdings

# While running
TAB                        # Next group
Shift+TAB                  # Previous group
q                          # Quit
```

Tracks positions, shows P&L, supports multiple watchlist groups. Config encrypted.

**tickrs** - Terminal stock tracker (interactive charts)
```bash
tickrs                     # Run with config
tickrs -s AAPL,MSFT        # Watch specific symbols
tickrs -t 1W               # Time frame
tickrs --show-volumes      # Volume graphs

# While running
a/d                        # Add/remove stock
s                          # Change time frame
Tab                        # Cycle panes
```

Interactive with line/candle/kagi charts, volume graphs, pre/post market data. Config encrypted.

## Fonts

**JetBrains Mono Nerd Font** - Monospace font with ligatures and icons

## Tool Categories Summary

| Category | Tools |
|----------|-------|
| **Shell** | Zsh, Starship, Atuin, Zellij |
| **Terminal** | kitty |
| **Files** | eza, bat, fd, zoxide, ouch, dust, duf |
| **Search** | ripgrep, fzf, jq |
| **Git** | git, gh, git-absorb, delta, lazygit, gitleaks, trufflehog |
| **Languages** | fnm (Node) |
| **Python** | ruff, uv, ty |
| **Editors** | VS Code, Zed, PyCharm |
| **Productivity** | Raycast, just, hyperfine, sd, tlrc, ticker, tickrs |
| **Network** | httpie, doggo, trippy, iperf3, speedtest, wget |
| **Security** | age, gnupg, openssh |

## Configuration Locations

```
~/.config/starship.toml          # Starship prompt
~/.config/atuin/config.toml      # Atuin history
~/.config/zellij/config.kdl      # Zellij multiplexer
~/.config/kitty/kitty.conf       # kitty terminal
~/.config/bat/config             # Bat viewer
~/.ticker.yaml                                        # ticker (encrypted in repo)
~/Library/Application Support/tickrs/config.yml      # tickrs (encrypted in repo)
~/.gitconfig                     # Git configuration
~/.zshrc                         # Zsh shell
~/.ssh/config                    # SSH configuration
```

## Learning Resources

```bash
man <tool>              # Manual
<tool> --help           # Help
tldr <tool>             # Simplified examples (tlrc)
```

Links:
- [Modern Unix](https://github.com/ibraheemdev/modern-unix) - CLI tools list
- [awesome-shell](https://github.com/alebcay/awesome-shell) - Shell stuff
- [Command Line Power User](https://commandlinepoweruser.com/) - Video course
