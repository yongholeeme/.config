#!/bin/bash

# macOS Configuration Helper

get_arch() {
    case "$(uname -m)" in
        x86_64) echo "Intel" ;;
        arm64)  echo "Apple Silicon" ;;
        *)      echo "$(uname -m)" ;;
    esac
}

# Install Homebrew if needed
install_homebrew() {
    if ! command -v brew &> /dev/null; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

# Setup macOS configurations
setup_macos_configs() {
    local config_dir="$HOME/.config"
    
    # Install packages from Brewfile
    if [[ -f "$config_dir/Brewfile" ]]; then
        brew bundle install --file="$config_dir/Brewfile"
    fi
    
    # Set macOS defaults
    defaults write com.apple.dock autohide -bool true
    defaults write com.apple.dock minimize-to-application -bool true
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true
    
    # Restart Dock to apply changes
    killall Dock
}

echo "🍎 macOS $(sw_vers -productVersion)"
echo "💻 $(get_arch) Mac"