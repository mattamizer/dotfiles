#!/bin/bash -e

which -s brew && brew update
which -s brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

if ! brew doctor; then
  echo "\`brew doctor\` failed. Please resolve issues before continuing."
  exit 1
fi

brew tap homebrew/binary
brew tap neovim/homebrew-neovim
brew tap thoughtbot/formulae

formulae=(
  ag
  boot2docker
  caskroom/cask/brew-cask
  chruby
  cloc
  git
  heroku-toolbelt
  hub
  neovim
  pick
  python
  nvm
  q-queue
  reattach-to-user-namespace
  rr
  ruby-install
  tmux-status-bar
  tree
  use
  watch
  wemux
  wget
)

casks=(
  1password
  arq
  dropbox
  flux
  iterm2
  java
  nvalt
  skype
  slate
  vagrant
  virtualbox
)

brew tap | grep "cask" > /dev/null || brew tap phinze/homebrew-cask

for formula in "${formulae[@]}"; do
  brew install $formula || brew upgrade $formula
done

for cask in "${casks[@]}"; do
  brew cask install $cask
done
