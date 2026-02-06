# Terminal Setup Guide

Terminal setup with Zellij, Starship, Atuin, and better CLI tools.

## Terminal Emulator: kitty

[kitty](https://sw.kovidgoyal.net/kitty/) - Fast, GPU-accelerated terminal. Better battery life than Ghostty, proper CMD+click for URLs.

## Session Management: Zellij

[Zellij](https://zellij.dev/) - Terminal multiplexer (like tmux/screen but less painful).

### Basic Commands

```bash
zj                      # Start zellij (alias)
zja name                # Attach to session (alias)
zjl                     # List sessions (alias)
zellij -s project       # Named session
zellij delete-session   # Kill session
```

### Key Bindings (Default)

- `Ctrl+p` - Pane mode (create/close panes)
- `Ctrl+t` - Tab mode (create/close tabs)
- `Ctrl+n` - Resize mode
- `Ctrl+h` - Move mode (navigate panes)
- `Ctrl+s` - Scroll mode
- `Ctrl+o` - Session mode
- `Ctrl+q` - Quit mode

### Common Workflows

**Split Panes**: `Ctrl+p` then `n` (down) or `d` (right)
**Navigate**: `Ctrl+h` then arrow keys or `hjkl`
**Tabs**: `Ctrl+t` then `n` for new, numbers to switch

### Session Persistence

Crashes don't kill your work. Magic.

## Shell History: Atuin

[Atuin](https://atuin.sh/) - Shell history with fuzzy search.

### Key Bindings

- `Ctrl+r` - Search history (fuzzy search)
- `Up arrow` - Navigate history
- `Ctrl+↑` - Search history with current command as filter

### Search Syntax

Type to search. Use filters like `exit_code:0` or `directory:/path`.

### Privacy

No cloud, workspaces enabled, fuzzy search. Your commands stay on your machine.

## Prompt: Starship

[Starship](https://starship.rs/) - Fast, customizable prompt.

### What It Shows

Directory, git branch/status, language versions, timing (if >2s), exit codes.

Git symbols: `*` modified, `+` staged, `!` deleted, `?` untracked, `⇡⇣` ahead/behind, `$` stashed.

## CLI Tools

Unix tools but better:

### File Listing: eza

```bash
ls          # eza --icons (colorized with icons)
ll          # eza -lah --icons (detailed list)
lt          # eza --tree (tree view)

# Original commands still available
/bin/ls     # Traditional ls
```

### File Viewing: bat

```bash
cat file.txt           # bat with syntax highlighting
bat --plain file.txt   # bat without decorations

# View with line numbers
bat -n file.txt

# Original command
/bin/cat file.txt
```

### File Finding: fd

```bash
find . -name "*.js"    # Old way
fd "\.js$"             # Better way

# Usage
fd test                # Find files/dirs matching "test"
fd -e js               # Find all .js files
fd -H pattern          # Include hidden files
fd -t f pattern        # Only files
fd -t d pattern        # Only directories
```

### Content Search: ripgrep

```bash
grep -r "pattern" .    # Old and slow
rg "pattern"           # Fast

# Usage
rg "TODO"              # Find all TODOs
rg -i "pattern"        # Case insensitive
rg -t js "pattern"     # Search only JS files
rg -C 3 "pattern"      # Show 3 lines of context
```

### Directory Navigation: zoxide

```bash
cd /long/path/to/project    # The old way
z project                   # The lazy way

# Usage
z proj        # Fuzzy match
zi            # Interactive selection
zoxide query  # Show matches
```

Learns your directory patterns. Because typing full paths is for people with time.

### Git Diffs: delta

Automatically integrated with git:

```bash
git diff              # Uses delta
git log -p            # Logs with delta
git show              # Show with delta
```

Features:
- Syntax highlighting
- Side-by-side diffs
- Line numbers
- Merge conflicts that don't hurt your eyes

## Shell Integration

### Directory-Specific Environments: direnv

Automatically loads/unloads environment variables based on directory.

```bash
# Create .envrc in project directory
echo 'export API_KEY=secret' > .envrc

# Allow the file (one-time per file change)
direnv allow

# Variables automatically load when entering directory
# And unload when leaving
```

### Fast Node Version Manager: fnm

20x faster than nvm.

```bash
# Install Node version
fnm install 20

# Set default version
fnm default 20

# List installed versions
fnm list

# Use specific version in current shell
fnm use 18

# Auto-switch based on .node-version or .nvmrc
# (automatic with --use-on-cd flag in config)
```

## Quick Reference

See [cheatsheet.md](./cheatsheet.md) for full reference.

## Keyboard Shortcuts Summary

| Action | Shortcut |
|--------|----------|
| Search history | `Ctrl+r` |
| Zellij pane mode | `Ctrl+p` |
| Zellij tab mode | `Ctrl+t` |
| Zellij move mode | `Ctrl+h` |
| Clear screen | `Ctrl+l` |
| Interrupt command | `Ctrl+c` |
| End of line | `Ctrl+e` |
| Start of line | `Ctrl+a` |
| Delete word | `Ctrl+w` |

## Learning More

```bash
# Tool help
man zellij
starship explain
atuin --help
bat --help
fd --help
rg --help

# Configuration locations
~/.config/starship.toml
~/.config/atuin/config.toml
~/.config/zellij/config.kdl
~/.config/bat/config
```
