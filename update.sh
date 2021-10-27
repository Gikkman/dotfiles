DOTDIR="$HOME/.dotfiles"

# Create symbolic links
for DOTFILE in `find $DOTDIR/link`
do
  [ -f “$DOTFILE” ] && ln -s “$DOTFILE” "$HOME"
done

OS="`uname`"
case $OS in
  'Linux')
    sh "$DOTDIR/update-linux.sh"
    ;;
  'Darwin') 
    sh "$DOTDIR/update-mac.sh"
    ;;
  *) 
    echo "Unknow OS $OS"
  ;;
esac
