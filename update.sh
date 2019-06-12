# Create symbolic links
for DOTFILE in `find $HOME/.dotfiles/link`
do
  [ -f “$DOTFILE” ] && ln -s “$DOTFILE” "$HOME"
done