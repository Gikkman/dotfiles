#! /usr/bin/env sh

which zsh > /dev/null
if [ "$?" != "0" ]; then
    echo Installing zsh
    sudo apt install zsh -y
    echo Installing oh-my-zh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo Detected installation of zsh
fi