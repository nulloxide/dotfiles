# Why These Tools?

## Philosophy

Fast. Simple. Rust when possible.

If it makes me wait, it's gone. If it needs 50 config files, it's gone.

## Shell Stack

**Zsh** - Works everywhere, Oh-My-Zsh plugins useful
**Starship** - 10x faster than Oh-My-Zsh themes, Rust-based
**kitty** - GPU-accelerated, better battery than Ghostty, CMD+click works, image support
**Zellij** - Better UX than tmux, I can remember the commands
**Atuin** - Fuzzy search that works, SQLite-backed, no cloud

## Language Tools

**fnm** - 20x faster than nvm, Rust-based, auto-switches
**uv** - Fastest Python package manager, Rust
**ruff** - 100x faster than black/flake8, Rust
**ty** - Fast type checking

## CLI Tools

**eza** > ls - Colors, icons, git status
**bat** > cat - Syntax highlighting
**fd** > find - Fast, sane syntax
**ripgrep** > grep - Fastest search, used by VS Code
**zoxide** > cd - Learns patterns, fuzzy matching
**delta** > diff - Readable git diffs

## Git

**git-absorb** - Auto fixup commits
**gh** - PRs from terminal

## Editors

**Zed** - Fast, Rust-based, multiplayer
**PyCharm** - Python IDE that works

## Dotfiles

**chezmoi** - Encryption built-in, templates, bootstrap scripts

## Not Here

**No Docker Desktop** - CLI works, it's free
**No VS Code** - Have Zed and PyCharm
**No fancy vim** - Basic vimrc, use real IDE
**No tmux** - Zellij better
**No pyenv** - uv handles it
**No conda** - Too heavy

## Rules

1. Rust version? Use it
2. >50 lines config? Skip it
3. Slower than original? Why?
4. Default broken? Too complex

## Exceptions

**Oh-My-Zsh** - Bloated but plugins useful
**Homebrew** - Slow but has everything
**macOS** - Not Linux but works without driver hell

Speed matters. Time matters. If it ain't broke, leave it.
