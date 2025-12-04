# Install apps
if ! $(${DOTDIR}/util/is-installed.sh brew); then
  echo "Homebrew not detected. Installing..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "Homebrew installed"
else
  echo "Brew already installed"
fi

brew bundle

# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh
