#!/bin/bash

# Configuration Validation and Health Check Script

set -e

CONFIG_DIR="$HOME/.config"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

print_header() { echo -e "\n${BLUE}=== $1 ===${NC}"; }
print_success() { echo -e "${GREEN}✅ $1${NC}"; }
print_warning() { echo -e "${YELLOW}⚠️  $1${NC}"; }
print_error() { echo -e "${RED}❌ $1${NC}"; }

check_command() {
    local cmd="$1"
    local desc="$2"
    
    if command -v "$cmd" &> /dev/null; then
        local version=$(eval "$cmd --version 2>/dev/null | head -n1" || echo "unknown")
        print_success "$desc: $version"
        return 0
    else
        print_error "$desc not found"
        return 1
    fi
}

check_file() {
    local file="$1"
    local desc="$2"
    
    if [[ -f "$file" ]]; then
        print_success "$desc exists"
        return 0
    else
        print_error "$desc not found: $file"
        return 1
    fi
}

check_symlink() {
    local link="$1"
    local desc="$2"
    
    if [[ -L "$link" ]]; then
        local target=$(readlink "$link")
        print_success "$desc -> $target"
        return 0
    else
        print_warning "$desc is not a symlink: $link"
        return 1
    fi
}

# Main validation
print_header "System Information"
echo "OS: $(uname -s)"
echo "Architecture: $(uname -m)"
echo "Shell: $SHELL"
echo "User: $USER"

print_header "Package Managers"
check_command "brew" "Homebrew"
check_command "npm" "NPM"
check_command "node" "Node.js"
check_command "nvm" "NVM"

print_header "Development Tools"
check_command "git" "Git"
check_command "gh" "GitHub CLI"
check_command "code" "VS Code"
check_command "nvim" "Neovim"

print_header "Configuration Files"
check_file "$HOME/.zshrc" "Main zsh config"
check_file "$CONFIG_DIR/zshrc/.zshrc" "Modular zsh config"
check_file "$CONFIG_DIR/Brewfile" "Brewfile"

print_header "Shell Configuration Modules"
for module in "$CONFIG_DIR/zshrc"/*.zshrc; do
    if [[ -f "$module" ]]; then
        local module_name=$(basename "$module")
        print_success "Module: $module_name"
    fi
done

print_header "Application Configurations"
configs=(
    "$HOME/.config/nvim/init.vim:Neovim config"
    "$HOME/.config/gh/config.yml:GitHub CLI config"
    "$HOME/.config/fish/config.fish:Fish shell config"
    "$HOME/.gitconfig:Git global config"
)

for config in "${configs[@]}"; do
    local file="${config%:*}"
    local desc="${config#*:}"
    check_file "$file" "$desc"
done

print_header "Homebrew Bundle Check"
if command -v brew &> /dev/null && [[ -f "$CONFIG_DIR/Brewfile" ]]; then
    echo "Checking Brewfile consistency..."
    cd "$CONFIG_DIR"
    if brew bundle check --verbose; then
        print_success "All Brewfile packages are installed"
    else
        print_warning "Some Brewfile packages are missing"
        echo "Run 'brew bundle install' to install missing packages"
    fi
fi

print_header "VS Code Extensions"
if command -v code &> /dev/null; then
    echo "Installed extensions:"
    code --list-extensions | head -5
    echo "..."
    echo "Total: $(code --list-extensions | wc -l) extensions"
fi

print_header "Environment Variables"
important_vars=(
    "CONFIG"
    "PATH"
    "NVM_DIR"
    "EDITOR"
)

for var in "${important_vars[@]}"; do
    if [[ -n "${!var}" ]]; then
        print_success "$var = ${!var}"
    else
        print_warning "$var not set"
    fi
done

print_header "Validation Complete"
echo -e "\nFor any issues found, consider running:"
echo "  ./install.sh    - Reinstall configurations"
echo "  ./backup.sh backup - Create a backup"
echo "  brew bundle install - Install missing packages"