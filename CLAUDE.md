# Claude Code Instructions

This is RC's dotfiles repository. When asked to set up this Mac, follow these instructions.

## First-Time Setup

Run these steps in order:

1. **Install Xcode Command Line Tools** (if not installed):
   ```bash
   xcode-select --install
   ```
   Wait for installation to complete before proceeding.

2. **Install Homebrew** (if not installed):
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
   For Apple Silicon, also run:
   ```bash
   eval "$(/opt/homebrew/bin/brew shellenv)"
   ```

3. **Install all packages and apps**:
   ```bash
   brew bundle --file=~/dotfiles/Brewfile
   ```

4. **Install Oh My Zsh** (if not installed):
   ```bash
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
   ```

5. **Link config files** (backup existing files first):
   ```bash
   # .zshrc
   [ -f ~/.zshrc ] && [ ! -L ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.backup
   ln -sf ~/dotfiles/.zshrc ~/.zshrc

   # .gitconfig
   [ -f ~/.gitconfig ] && [ ! -L ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig.backup
   ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

   # Zed settings
   mkdir -p ~/.config/zed
   [ -f ~/.config/zed/settings.json ] && [ ! -L ~/.config/zed/settings.json ] && mv ~/.config/zed/settings.json ~/.config/zed/settings.json.backup
   ln -sf ~/dotfiles/config/zed/settings.json ~/.config/zed/settings.json
   ```

6. **Source autojump** (already in .zshrc, but verify):
   The .zshrc should contain:
   ```bash
   [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
   ```

7. **Restart the terminal** or run `source ~/.zshrc`

## Alternative: Run the Setup Script

Instead of manual steps, just run:
```bash
~/dotfiles/setup.sh
```

## What Gets Installed

### Apps (casks)
- Zed (editor)
- Google Chrome
- Rectangle (window manager)
- Ghostty (GPU-accelerated terminal)

### Python tooling
- python, uv, ruff

### Node.js / TypeScript
- node, pnpm, typescript

### CLI tools
- git, gh, autojump
- starship, zoxide, fzf (shell UX)
- eza, bat, ripgrep (modern coreutils)

### Shell
- Oh My Zsh with plugins: git, autojump, common-aliases, aliases, docker, npm, brew

## File Structure

| File | Links to | Purpose |
|------|----------|---------|
| `.zshrc` | `~/.zshrc` | Zsh + Oh My Zsh config |
| `.gitconfig` | `~/.gitconfig` | Git aliases (ci, co, st, etc.) + user info |
| `config/zed/settings.json` | `~/.config/zed/settings.json` | Zed theme and fonts |
| `Brewfile` | - | All Homebrew packages and casks |
| `setup.sh` | - | Automated setup script |

## Common Tasks

| Task | Command |
|------|---------|
| Add a new app | Add `cask "app-name"` to Brewfile, run `brew bundle` |
| Add a CLI tool | Add `brew "tool-name"` to Brewfile, run `brew bundle` |
| Add a zsh plugin | Add to `plugins=()` in .zshrc |
| Add a git alias | Add to `[alias]` in .gitconfig |
| Update Zed settings | Edit `config/zed/settings.json` |

## After Making Changes

```bash
cd ~/dotfiles
git add -A
git commit -m "Description of changes"
git push
```
