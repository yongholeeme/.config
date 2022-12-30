alias bp='vi ~/.yongholeeme/.zshrc'
alias bpp='source ~/.zshrc'

# shortcut
alias c='clear'
alias l='ls -al'

alias git-local-config='git config --local user.name "yongholeeme" && git config --local user.email "inwalter99@gmail.com"'

# [NVM]
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# [Homebrew]
# /bin/bash -c '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)'
eval "$(/opt/homebrew/bin/brew shellenv)"

# [Starship]
# curl -sS https://starship.rs/install.sh | sh
export STARSHIP_CONFIG=~/.yongholeeme/starship.toml
eval "$(starship init zsh)"