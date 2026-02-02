# Dotfiles

Personal macOS development environment setup.

## Quick Start

On a fresh Mac:

```bash
# Install Xcode CLI tools (includes git)
xcode-select --install

# Clone this repo
git clone https://github.com/rc-chandru/dotfiles.git ~/dotfiles

# Run Claude Code and say "set up this Mac"
claude
```

Or run the setup script directly:
```bash
~/dotfiles/setup.sh
```

## What's Included

### Apps (via Homebrew)
- Zed (editor)
- Google Chrome
- Rectangle (window manager)
- iTerm2

### Python
- python
- uv (fast package manager)
- ruff (linter & formatter)

### Node.js / TypeScript
- node
- pnpm (fast package manager)
- typescript

### CLI Tools
- git
- autojump

### Shell
- Oh My Zsh with plugins:
  - git
  - autojump
  - common-aliases
  - aliases
  - docker
  - npm
  - brew

### Git Aliases
| Alias | Command |
|-------|---------|
| `git ci` | commit |
| `git co` | checkout |
| `git br` | branch |
| `git st` | status |
| `git df` | diff |
| `git lg` | log --oneline --graph |
| `git cm "msg"` | commit -m |
| `git ca` | commit --amend |

## Adding New Apps

Edit `Brewfile` and run:
```bash
brew bundle --file=~/dotfiles/Brewfile
```

Find cask names with `brew search --cask <app>`.

## Files

| File | Description |
|------|-------------|
| `setup.sh` | Bootstrap script for new machines |
| `Brewfile` | Homebrew packages and apps |
| `.zshrc` | Zsh configuration |
| `.gitconfig` | Git aliases and user config |
| `config/zed/settings.json` | Zed editor settings |
