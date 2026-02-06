# Troubleshooting (When You Break Stuff)

Fixes for common problems.

## SSH Keys Not Working

**Symptoms**: Can't connect to servers, permission denied

**Fix**:
```bash
# Fix permissions
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_*
chmod 644 ~/.ssh/*.pub

# Add to agent
ssh-add ~/.ssh/your_key

# Verify keys are loaded
ssh-add -l
```

## Path Issues

**Symptoms**: Commands not found, wrong versions running

**Fix**:
```bash
# Check PATH
echo $PATH

# Reload shells
source ~/.zprofile
source ~/.zshrc

# Check which binary is running
which node
which python
```

**Remember**: PATH is set in `.zprofile` (login shell), not `.zshrc`

## Homebrew Problems

**Symptoms**: Packages won't install, weird errors

**Fix**:
```bash
# Check for issues
brew doctor

# Update everything
brew update && brew upgrade

# Clean old versions
brew cleanup

# Nuclear option
brew uninstall package
brew install package
```

## Starship Not Loading

**Symptoms**: Boring prompt, no git status

**Fix**:
```bash
# Verify installed
which starship

# Check init line in .zshrc
grep starship ~/.zshrc

# Reload
source ~/.zshrc

# Test config
starship config
```

## Git Credentials Issues

**Symptoms**: Always asking for password

**Fix**:
```bash
# Check remote URL (should be SSH not HTTPS)
git remote -v

# Switch to SSH
git remote set-url origin git@github.com:username/repo.git

# Verify SSH works
ssh -T git@github.com
```

## chezmoi Encryption Problems

**Symptoms**: Can't decrypt files, wrong key

**Fix**:
```bash
# Check key exists
cat ~/.config/chezmoi/key.txt

# Verify recipient in config
cat ~/.config/chezmoi/chezmoi.toml

# Re-add encrypted file
chezmoi add --encrypt ~/.ssh/key
```

**Lost your key?** You're screwed. That's why you backup.

## Zellij Session Issues

**Symptoms**: Can't attach, sessions lost

**Fix**:
```bash
# List sessions
zellij list-sessions

# Kill zombie session
zellij delete-session session-name

# Kill all sessions
zellij kill-all-sessions

# Check if already in session
echo $ZELLIJ
```

## fnm Node Version Problems

**Symptoms**: Wrong Node version, command not found

**Fix**:
```bash
# Check what's installed
fnm list

# Check current version
node --version

# Switch version
fnm use 20

# Set default
fnm default 20

# Verify fnm is initialized (should be in .zshrc)
grep fnm ~/.zshrc
```

## Slow Shell Startup

**Symptoms**: Takes forever to open new terminal

**Debug**:
```bash
# Time zsh startup
time zsh -i -c exit

# Profile startup (add to top of .zshrc)
zmodload zsh/zprof
# (add to bottom of .zshrc)
zprof
```

**Common causes**:
- Too many Oh-My-Zsh plugins
- Slow network checks
- Conda init (we don't use this)
- nvm (we use fnm instead)

## Atuin History Not Syncing

**Symptoms**: History missing, search not working

**Fix**:
```bash
# Check if running
atuin status

# Rebuild database
atuin import auto

# Check config
cat ~/.config/atuin/config.toml

# Verify init (should be in .zshrc)
grep atuin ~/.zshrc
```

## Brew Bundle Install Fails

**Symptoms**: Some packages won't install from Brewfile

**Fix**:
```bash
# Install with verbose output
cd ~/.local/share/chezmoi
brew bundle install --verbose

# Skip failing packages
brew bundle install --no-upgrade

# Check which failed
brew bundle check
```

**Casks requiring sudo**: Install these manually:
```bash
brew install --cask package-name
```

## Git Absorb Not Working

**Symptoms**: "No fixup commits created"

**Common issues**:
- No commits to fixup (need existing commits)
- Changes not staged (`git add` first)
- Files not tracked by git

**Fix**:
```bash
# Stage changes first
git add changed_file.js

# Check git blame works
git blame changed_file.js

# Run absorb
git absorb
```

## macOS Settings Not Applied

**Symptoms**: Settings back to defaults after reboot

**Fix**:
- Log out and back in
- Some settings need full restart
- Check script ran: `ls -la ~/.local/share/chezmoi/.chezmoiscripts/`

## Commands Taking Forever

**Symptoms**: Everything's slow

**Check**:
```bash
# Network issues?
ping 8.8.8.8

# Disk issues?
df -h

# Too many processes?
top

# Homebrew issues?
brew cleanup
```

## Still Broken?

1. Check docs again: `ls ~/.local/share/chezmoi/docs/`
2. Read the actual error message
3. Google the error message
4. Check tool's GitHub issues
5. Delete it and reinstall (nuclear option)

## Last Resort

```bash
# Nuke chezmoi and start over
cd ~
rm -rf ~/.local/share/chezmoi
chezmoi init --apply nulloxide
```

**Before nuking**: Backup your encryption key!
