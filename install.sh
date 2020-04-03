#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

DIR="$HOME/.oh-my-zsh"
if [ -d "$DIR" ]; then
  echo "oh-my-zsh already installed..."
else
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew bundle install
    brew upgrade
else
    brew bundle install
    brew update
    brew upgrade
fi


rm -rf "$HOME/.vimrc"
rm -rf "$HOME/.zshrc"
yes | cp -rf .zshrc "$HOME/.zshrc"
yes | cp -rf .vimrc "$HOME/.vimrc"
source "$HOME/.vimrc"
source "$HOME/.zshrc"
