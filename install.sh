#!/bin/sh

# Check for Homebrew and install if need it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Prepare for symlinking
mv $HOME/.config $HOME/.config_old
rm -rf $HOME/.config

# Symlink necessary dotfiles
ln -sf $DIR/.config $HOME/.config
ln -sf $DIR/.zshrc $HOME/.zshrc

# Update Homebrew recipes
brew update

# Install all Homebrew dependencies with bundle
brew tap homebrew/bundle
brew bundle --file $DIR/Brewfile
