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

# Install nice-to-haves
sudo apt-get install -y unzip make

# Install Node and npm
curl -L https://bit.ly/n-install | N_PREFIX=~/.n bash -s -- -y

# Set git to use credentials store
git config --global credential.helper store
