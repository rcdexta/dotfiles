# Claude Code Guidelines

This is a dotfiles repository for macOS development environment setup.

## Structure

- `setup.sh` - Main bootstrap script, runs on fresh machines
- `Brewfile` - Homebrew Bundle file listing all packages and casks
- `.zshrc` - Zsh config with Oh My Zsh plugins
- `.gitconfig` - Git aliases and user configuration

## Conventions

- All config files are symlinked from `~/dotfiles/` to `~/`
- The setup script backs up existing files before linking
- Brewfile uses `brew` for CLI tools and `cask` for GUI apps

## Common Tasks

- **Add a new app**: Add `cask "app-name"` to Brewfile
- **Add a CLI tool**: Add `brew "tool-name"` to Brewfile
- **Add a zsh plugin**: Add to the `plugins=()` array in .zshrc
- **Add a git alias**: Add to `[alias]` section in .gitconfig

## Testing Changes

After modifying config files, run:
```bash
source ~/.zshrc  # for shell changes
```

For Brewfile changes:
```bash
brew bundle --file=~/dotfiles/Brewfile
```
