#!/bin/bash

set -e

echo "🚀 Starting macOS dotfiles installation..."

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

CONFIG_DIR="$HOME/.config"

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    print_status "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    print_status "Homebrew already installed"
fi

# Install packages from Brewfile
if [[ -f "$CONFIG_DIR/Brewfile" ]]; then
    print_status "Installing packages from Brewfile..."
    cd "$CONFIG_DIR"
    brew bundle install
else
    print_warning "Brewfile not found"
fi

# Set up shell/editor symlinks via init.sh
print_status "Setting up dotfile symlinks..."
bash "$CONFIG_DIR/init.sh"

# Allow VS Code key repeat (disable press-and-hold accent popup)
print_status "Applying macOS settings..."
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

print_status "✅ Installation completed!"
exec zsh -l
