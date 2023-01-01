alias bp='vi ~/.yongholeeme/.zshrc'
alias bpp='source ~/.zshrc'

# shortcut
alias c='clear'
export CLICOLOR=1
alias l='ls -al'
alias ls='ls -G'
alias ll='ls -lG'

# [nginx]
alias nginx-start='nginx'
alias nginx-stop='nginx -s stop'
alias nginx-reload='nginx -s reload'

# [GIT]
alias gs='git status'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gmr='git merge -'
alias gc-='git checkout'
alias gcb='git checkout -b'
alias gfpush='git push --force origin $(git branch --show-current)'
alias gpush='git push origin $(git branch --show-current)'
alias gpull='git pull origin $(git branch --show-current)'
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
