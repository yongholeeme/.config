export PATH="$HOME/.local/bin:$PATH"
export CONFIG="$HOME/.config"
alias config='code ~/.config'

. $CONFIG/zshrc/terminal.zshrc
. $CONFIG/zshrc/nginx.zshrc
. $CONFIG/zshrc/brew.zshrc
. $CONFIG/zshrc/fnm.zshrc
. $CONFIG/zshrc/git.zshrc
. $CONFIG/zshrc/rancher.zshrc
. $CONFIG/zshrc/proxyman.zshrc
. $CONFIG/zshrc/claude.zshrc

if [[ -d $CONFIG/zshrc/work ]]; then
  . $CONFIG/zshrc/work/.zshrc
fi
