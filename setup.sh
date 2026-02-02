#!/bin/bash
set -e

echo "==> Setting up your Mac..."

# Install Xcode Command Line Tools
if ! xcode-select -p &>/dev/null; then
    echo "==> Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "Press any key after Xcode tools are installed..."
    read -n 1
fi

# Install Homebrew
if ! command -v brew &>/dev/null; then
    echo "==> Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon
    if [[ $(uname -m) == "arm64" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

# Install packages from Brewfile
echo "==> Installing Homebrew packages..."
brew bundle --file=~/dotfiles/Brewfile

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "==> Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Link .zshrc
echo "==> Linking .zshrc..."
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi
ln -sf ~/dotfiles/.zshrc ~/.zshrc

echo "==> Setup complete! Restart your terminal."
