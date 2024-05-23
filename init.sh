curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

echo '### this is overwrited by config/init.sh
export CONFIG="$HOME/.config"
source $CONFIG/zshrc/.zshrc
###' > ~/.zshrc

source ~/.zshrc
