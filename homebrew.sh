#!/bin/bash -e

which -s brew && brew update
which -s brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

if ! brew doctor; then
  echo "\`brew doctor\` failed. Please resolve issues before continuing."
  exit 1
fi

brew tap homebrew/binary
brew tap justincampbell/formulae
brew tap neovim/homebrew-neovim
brew tap thoughtbot/formulae

formulae=(
  ag
  boot2docker
  caskroom/cask/brew-cask
  cacheout
  chruby
  cloc
  git
  heroku-toolbelt
  hub
  jq
  neovim
  pick
  python
  reattach-to-user-namespace
  ruby-install
  tmate
  tmux-status-bar
  tree
  watch
  wemux
  wget
)

casks=(
  arq
  flux
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
