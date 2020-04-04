#!/bin/zsh
echo "Who should I install this for? "
read user
echo "Install Pure Prompt? "
read pureAnswer
DIR="/Users/$user/.oh-my-zsh"
if [ -d "$DIR" ]; then
  echo "oh-my-zsh already installed..."
else
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

fi


which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /dev/null 2>&1
    brew bundle install
    brew upgrade
else
    echo "Homebrew already installed"
    brew bundle install
    brew update
    brew upgrade
fi

/bin/cp ./zshrc "/Users/$user/zshrc"
mv "/Users/$user/zshrc" "/Users/$user/.zshrc"
/bin/cp ./vimrc "/Users/$user/vimrc"
mv "/Users/$user/vimrc" "/Users/$user/.vimrc"

if [[ $pureAnswer == 'yes' ]] ; then
  npm install --global pure-prompt
  echo "autoload -U promptinit; promptinit" >> "/Users/$user/.zshrc"
  echo "prompt pure" >> "/Users/$user/.zshrc"
fi

source "/Users/$user/.vimrc"
source "/Users/$user/.zshrc"

