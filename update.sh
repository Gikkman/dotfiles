DOTDIR="$HOME/.dotfiles"

# Create symbolic links
for DOTFILE in `find $DOTDIR/link`
do
  [ -f “$DOTFILE” ] && ln -s “$DOTFILE” "$HOME"
done

# Install apps
if ! sh ${DOTDIR}/util/is-installed.sh brew; then
  echo "Homebrew not detected. Installing..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "Homebrew installed"
fi

brew bundle