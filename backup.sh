#!/bin/bash

# Configuration Backup and Restore Script
# Usage: ./backup.sh [backup|restore]

set -e

CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$CONFIG_DIR/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

print_status() { echo -e "${GREEN}[INFO]${NC} $1"; }
print_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
print_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Application-specific backup paths
declare -A APP_CONFIGS=(
    ["vscode"]="$HOME/Library/Application Support/Code/User"
    ["raycast"]="$HOME/.config/raycast"
    ["ssh"]="$HOME/.ssh"
    ["gitconfig"]="$HOME/.gitconfig"
    ["zshrc"]="$HOME/.zshrc"
    ["fish"]="$HOME/.config/fish"
    ["nvim"]="$HOME/.config/nvim"
    ["gh"]="$HOME/.config/gh"
)

backup_configs() {
    print_status "Creating backup at $BACKUP_DIR/$TIMESTAMP"
    mkdir -p "$BACKUP_DIR/$TIMESTAMP"
    
    for app in "${!APP_CONFIGS[@]}"; do
        local source_path="${APP_CONFIGS[$app]}"
        local backup_path="$BACKUP_DIR/$TIMESTAMP/$app"
        
        if [[ -e "$source_path" ]]; then
            print_status "Backing up $app configuration..."
            cp -R "$source_path" "$backup_path"
        else
            print_warning "$app configuration not found at $source_path"
        fi
    done
    
    # Backup Homebrew packages
    print_status "Backing up Homebrew packages..."
    brew bundle dump --file="$BACKUP_DIR/$TIMESTAMP/Brewfile" --force
    
    print_status "✅ Backup completed at $BACKUP_DIR/$TIMESTAMP"
}

restore_configs() {
    local restore_date="$1"
    
    if [[ -z "$restore_date" ]]; then
        print_error "Please specify a backup date (format: YYYYMMDD_HHMMSS)"
        echo "Available backups:"
        ls -1 "$BACKUP_DIR" 2>/dev/null || echo "No backups found"
        exit 1
    fi
    
    local restore_path="$BACKUP_DIR/$restore_date"
    
    if [[ ! -d "$restore_path" ]]; then
        print_error "Backup not found: $restore_path"
        exit 1
    fi
    
    print_warning "This will overwrite current configurations!"
    read -p "Continue? (y/N): " -n 1 -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_status "Restore cancelled"
        exit 0
    fi
    
    for app in "${!APP_CONFIGS[@]}"; do
        local backup_path="$restore_path/$app"
        local target_path="${APP_CONFIGS[$app]}"
        
        if [[ -e "$backup_path" ]]; then
            print_status "Restoring $app configuration..."
            rm -rf "$target_path"
            cp -R "$backup_path" "$target_path"
        fi
    done
    
    # Restore Homebrew packages
    if [[ -f "$restore_path/Brewfile" ]]; then
        print_status "Restoring Homebrew packages..."
        brew bundle install --file="$restore_path/Brewfile"
    fi
    
    print_status "✅ Restore completed"
}

case "$1" in
    backup)
        backup_configs
        ;;
    restore)
        restore_configs "$2"
        ;;
    *)
        echo "Usage: $0 {backup|restore [YYYYMMDD_HHMMSS]}"
        echo "Examples:"
        echo "  $0 backup"
        echo "  $0 restore 20231118_143022"
        exit 1
        ;;
esac