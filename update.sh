#! /usr/bin/env bash

DOTDIR="$HOME/.dotfiles"

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

# Create symbolic links
for LINKFILE in `find $DOTDIR/link`
do
  if [ -f "$LINKFILE" ]; then
    rm $LINKFILE
  fi
  ln -s "$LINKFILE" "$HOME"
done