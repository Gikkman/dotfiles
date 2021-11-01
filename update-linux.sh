#! /usr/bin/env bash

apt update 
apt upgrade

# Install zsh and oh-my-zsh
which zsh > /dev/null
if [ "$?" != "0" ]; then
    echo Installing zsh
    sudo apt install zsh -y
    echo Installing oh-my-zh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo Detected installation of zsh
fi

# Install Node17 and npm
curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
sudo apt-get install -y nodejs