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

## git-filter-repo

Powerful tool for rewriting git history. Safer and faster than `git filter-branch`.

### Common Operations

```bash
# Remove a file from entire history
git filter-repo --invert-paths --path secrets.env

# Remove a directory from entire history
git filter-repo --invert-paths --path-glob 'build/*'

# Replace text across all commits (strip sensitive strings)
git filter-repo --replace-text expressions.txt
# expressions.txt format: literal:OLD_TEXT==>NEW_TEXT

# Rewrite author info
git filter-repo --mailmap mailmap.txt
# mailmap.txt format: New Name <new@email.com> <old@email.com>

# Keep only a subdirectory (extract into its own repo)
git filter-repo --subdirectory-filter src/

# Analyze repo for large files and paths
git filter-repo --analyze
# Results in .git/filter-repo/analysis/
```

### Tips

- Always work on a **fresh clone** - filter-repo requires it by default
- Use `--force` to skip the fresh clone check (use carefully)
- Use `--dry-run` to preview changes before applying
- After rewriting, all collaborators must re-clone

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
