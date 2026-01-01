export NVM_DIR="$HOME/.nvm"

# Lazy load nvm - only loads when nvm/node/npm/npx/pnpm is first called
lazy_load_nvm() {
  unset -f nvm node npm npx pnpm pnpx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

nvm() { lazy_load_nvm && nvm "$@"; }
node() { lazy_load_nvm && node "$@"; }
npm() { lazy_load_nvm && npm "$@"; }
npx() { lazy_load_nvm && npx "$@"; }
pnpm() { lazy_load_nvm && pnpm "$@"; }
pnpx() { lazy_load_nvm && pnpx "$@"; }

# Auto-switch node version when entering directory with .nvmrc
autoload -U add-zsh-hook

load-nvmrc() {
  # Ensure nvm is loaded first
  if ! type nvm_find_nvmrc &>/dev/null; then
    lazy_load_nvm
  fi

  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
    corepack enable

  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
