alias bp='vi ~/.yongholeeme/.zshrc'
alias bpp='source ~/.zshrc'

# shortcut
alias c='clear'
alias l='ls -al'

alias git-local-config='git config --local user.name "yongholeeme" && git config --local user.email "inwalter99@gmail.com"'

# Set PATH, MANPATH, etc., for Homebrew.
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# starship
export STARSHIP_CONFIG=~/.yongholeeme/starship.toml
eval "$(starship init zsh)"