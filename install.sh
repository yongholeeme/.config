#!/bin/bash

set -e

echo "🚀 Starting macOS dotfiles installation..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
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

# Install NVM
if [[ ! -d "$HOME/.nvm" ]]; then
    print_status "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
else
    print_status "NVM already installed"
fi

# Setup zsh configuration
print_status "Setting up zsh configuration..."
cat > ~/.zshrc << 'EOF'
### This file is managed by .config/install.sh
export CONFIG="$HOME/.config"
source $CONFIG/zshrc/.zshrc
###
EOF

# Setup symlinks for other config files
setup_symlinks() {
    local configs=(
        "fish/config.fish:$HOME/.config/fish/config.fish"
        "nvim/init.vim:$HOME/.config/nvim/init.vim"
        "gh/config.yml:$HOME/.config/gh/config.yml"
        "gh/hosts.yml:$HOME/.config/gh/hosts.yml"
    )
    
    for config in "${configs[@]}"; do
        local source_file="${config%:*}"
        local target_file="${config#*:}"
        local target_dir="$(dirname "$target_file")"
        
        if [[ -f "$CONFIG_DIR/$source_file" ]]; then
            print_status "Setting up $source_file..."
            mkdir -p "$target_dir"
            ln -sf "$CONFIG_DIR/$source_file" "$target_file"
        fi
    done
}

setup_symlinks

# Source the new zsh config
print_status "Reloading shell configuration..."
source ~/.zshrc 2>/dev/null || true

print_status "✅ Installation completed!"
print_status "Please restart your terminal or run 'source ~/.zshrc'"