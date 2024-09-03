export CONFIG="$HOME/.config"
alias config='code ~/.config'

. $CONFIG/zshrc/terminal.zshrc
. $CONFIG/zshrc/nginx.zshrc
. $CONFIG/zshrc/nvm.zshrc
. $CONFIG/zshrc/git.zshrc
. $CONFIG/zshrc/brew.zshrc
. $CONFIG/zshrc/nvim.zshrc
. $CONFIG/zshrc/rancher.zshrc
. $CONFIG/zshrc/warp.zshrc

if [[ -d $CONFIG/zshrc/work ]]; then
  . $CONFIG/zshrc/work/.zshrc 
fi
