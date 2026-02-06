# Git Aliases Reference

Quick reference for custom git aliases configured in `.gitconfig`.

## Workflow Aliases

### Basic Operations
```bash
git st                    # Status with short format (git status -sb)
git co <branch>           # Checkout branch
git br                    # List branches
git cm "message"          # Commit with message
git ca                    # Commit amend
git cane                  # Commit amend with no edit
```

### Push/Pull
```bash
git ps                    # Push
git pl                    # Pull
git pf                    # Push with force-with-lease (safer force push)
```

## Logging

### Graph Log
```bash
git lg                    # Commit graph
```

### Recent Activity
```bash
git last                  # Show last commit with stats
git recent                # List branches by commit date (most recent first)
```

## Undo Operations

```bash
git unstage <file>        # Remove from staging
git undo                  # Undo commit (keep your work, not your shame)
git uncommit              # Same as undo
```

## Stash Operations

```bash
git stash-all             # Stash including untracked files
git stash-list            # Pretty list of stashes with dates
```

## Diff Shortcuts

```bash
git df                    # Diff working directory
git dc                    # Diff cached/staged changes
```

## Branch Management

### Clean Up Merged Branches
```bash
git cleanup               # Fetch with prune and show branch status
git gone                  # Delete branches tracking removed remotes
```

The `gone` alias is particularly useful after PRs are merged - it automatically deletes local branches whose remote tracking branches no longer exist.

## Advanced Tools

### git-absorb
Automatically creates fixup commits for staged changes:

```bash
# Make changes to files
git add changed_file.js
git absorb                       # Creates fixup commits
git rebase -i --autosquash main  # Squash fixups
```

## Delta Integration

Git diff and merge tool uses [delta](https://github.com/dandavison/delta) for better visualization:
- Side-by-side diffs
- Syntax highlighting
- Line numbers
- Navigate mode enabled

## Configuration Details

All aliases are defined in `~/.gitconfig`:

```bash
chezmoi edit ~/.gitconfig  # Edit git configuration
```

Key features:
- `merge.conflictStyle = zdiff3` - Better conflict markers
- `diff.algorithm = histogram` - Improved diff algorithm
- `rerere.enabled = true` - Remember conflict resolutions
- `fetch.prune = true` - Auto-prune deleted remote branches
- `push.autoSetupRemote = true` - Auto-setup tracking branches

## Learning More

```bash
git <alias> --help        # Show what the alias does
git config --get-regexp alias  # List all git aliases
```
