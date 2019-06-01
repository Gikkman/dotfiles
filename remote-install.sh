#! /usr/bin/env bash

###########################################
# HELP SECTION
###########################################

if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP

Installs my dotfiles. A directory is created
at ~/.dotfiles, which will contain
all dotfiles. 

Files under /link will be symlinked into /~
Files under /bin will be executable
Files under /source will be sourced when a shell is created

Github repo:
https://github.com/Gikkman/.dotfiles

Copyright (c) 2019 Gikkman
Licensed under the MIT license.
HELP

exit; fi

###########################################
# Script start
###########################################

# Make sure git exists
command_exists () {
  type "$1" &> /dev/null ;
}
if ! command_exists git; then
  echo "No git installed. Aborting"
  exit -1
fi

# Ask for admin password upfront
# Then keep alive the existing `sudo` timestamp until the script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Create dotfiles directory if it doesn't already exist
GIT="https://github.com/gikkman/dotfiles"
DOTDIR="$HOME/.dotfiles"
if [ ! -d "$DOTDIR" ]; then
  echo "Cloning down dotfiles"
  mkdir -p "$DOTDIR"
  git clone "$GIT" "$DOTDIR"
else
  echo "Directory for dotfiles already existed"
fi

# Execute the local install/update
sh -c "$DOTDIR/update.sh"