. ~/.config/zshrc/terminal.zshrc
. ~/.config/zshrc/nginx.zshrc
. ~/.config/zshrc/nvm.zshrc
. ~/.config/zshrc/git.zshrc
. ~/.config/zshrc/brew.zshrc

if ! [[ -d ~/.config/zshrc/work ]]; then
  . ~/.config/zshrc/work/.zshrc 
fi
