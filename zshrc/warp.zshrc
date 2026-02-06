if [[ -d "$CONFIG/.warp/themes" ]] && ! diff -qr "$CONFIG/.warp/themes" ~/.warp/themes &>/dev/null; then
  mkdir -p ~/.warp/themes
  cp $CONFIG/.warp/themes/* ~/.warp/themes
fi