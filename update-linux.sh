apt update 
apt upgrade

# Install zsh 
which zsh > /dev/null
if [ "$?" != "0" ]; then
    echo Installing zsh
    sudo apt install zsh -y
else
    echo Detected installation of zsh
fi

# Install Node and npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install lts

# Set git to use credentials store
git config --global credential.helper store

# Install nice-to-haves
sudo apt-get install -y unzip
