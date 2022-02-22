# Run OS dependent installs
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

# Run generic installs
sh "$DOTDIR/update-generic.sh"

# Create symbolic links
for LINKFILE in $(find link -type f | sed "s#link/##")
do
  if [ -f $HOME/$LINKFILE ]; then
    rm $HOME/$LINKFILE
  fi
  ln -s "$DOTDIR/link/$LINKFILE" "$HOME/$LINKFILE"
done

MY_ZSH_THEME="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/gikk.zsh-theme"
if ! [ -f $MY_ZSH_THEME ]; then 
  ln -s $DOTDIR/custom/gikk.zsh-theme $MY_ZSH_THEME
fi