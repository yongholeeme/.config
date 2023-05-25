alias bp='vi ~/.yongholeeme/.zshrc'
alias bpp='source ~/.zshrc'

# [TERMINAL]
export CLICOLOR=1
alias c='clear'
alias l='ls -al'
alias ls='ls -Gt'

# [npm/pnpm]
alias npm='~/.yongholeeme/scripts/excuteNpmOrPnpm.sh'
alias pnpm='~/.yongholeeme/scripts/excuteNpmOrPnpm.sh'
alias pn=pnpm

# [nginx]
alias nginx-start='nginx'
alias nginx-stop='nginx -s stop'
alias nginx-reload='nginx -s reload'

# [GIT]
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gc-='git checkout'
alias gfpush='git push --force origin $(git branch --show-current)'
alias gpush='git push origin $(git branch --show-current)'
alias gpull='git pull origin $(git branch --show-current)'
alias gcp='git cherry-pick'
alias git-local-config='git config --local user.name "yongholeeme" && git config --local user.email "inwalter99@gmail.com"'

export PATH=~/.npm-global/bin:$PATH

# [NVM]
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# [NVM] Calling nvm use automatically in a directory with a .nvmrc file
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# [Homebrew]
# /bin/bash -c '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)'
eval "$(/opt/homebrew/bin/brew shellenv)"

# [Starship]
# curl -sS https://starship.rs/install.sh | sh
export STARSHIP_CONFIG=~/.yongholeeme/starship.toml
eval "$(starship init zsh)"

# This is for work zsh
. ~/.yongholeeme/.work.zshrc
