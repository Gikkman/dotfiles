#! /usr/bin/env bash

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

# Install Node17 and npm
curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
sudo apt-get install -y nodejs

# Set git to use credentials store
git config --global credential.helper store

# Install nice-to-haves
sudo apt-get install -y unzip
