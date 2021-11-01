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
for DOTFILE in `find $DOTDIR/link`
do
  if [ -f "$DOTFILE" ]; then
    rm $DOTFILE
  fi
  ln -s "$DOTFILE" "$HOME"
done