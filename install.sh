#! /usr/bin/env bash

###########################################
# HELP SECTION
###########################################

if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP

Installs my dotfiles. A directory is created
under ~/ called .dotfiles, which will contain
all dotfiles. 

Files under /link will be symlinked into /~
Files under /bin will be executable
Files under /source will be sourced when a shell is created

Github repo:
https://github.com/Gikkman/.dotfiles

Copyright (c) 2014 Gikkman
Licensed under the MIT license.
HELP

exit; fi

###########################################
# Script start
###########################################

# Ask for admin password upfront
# Then keep alive the existing `sudo` time stamp until the script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Set some varialbes
GIT="https://github.com/gikkman/dotfiles"
DOTFILES="$HOME/.dotfiles"

# Create dotfiles directory if it doesn't already exist
command_exists () {
  type "$1" &> /dev/null ;
}

if [ ! -d "$DOTFILES" ]; then
  if ! command_exists git; then
    echo "No git installed. Aborting"
    exit -1
  fi
  echo "Cloning down dotfiles"
  mkdir -p "$DOTFILES"
  git clone "$GIT" "$DOTFILES"
else
  echo "Directory for dotfiles already existed"
fi
