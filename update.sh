DOTDIR="$HOME/.dotfiles"

# Create symbolic links
for DOTFILE in `find $DOTDIR/link`
do
  [ -f "$DOTFILE" ] && ln -s “$DOTFILE” "$HOME"
done

OS=$(uname)
echo Detected OS $OS
case $OS in
  'Linux')
    echo "Running install for Linux"
    sh "$DOTDIR/update-linux.sh"
    ;;
  'Darwin') 
    echo "Running install for Mac"
    sh "$DOTDIR/update-mac.sh"
    ;;
  *) 
    echo "Unknow OS $OS"
  ;;
esac
