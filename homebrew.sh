#!/bin/bash -e

which -s brew && brew update
which -s brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

if ! brew doctor; then
  echo "\`brew doctor\` failed. Please resolve issues before continuing."
  exit 1
fi

brew tap neovim/homebrew-neovim
brew tap thoughtbot/formulae

formulae=(
  ag
  chruby
  cloc
  ctags
  flake8
  git
  heroku-toolbelt
  hub
  jq
  neovim
  pick
  pyenv
  reattach-to-user-namespace
  ruby-install
  slackcat
  tmate
  tree
  watch
  wemux
  wget
)

for formula in "${formulae[@]}"; do
  brew install $formula || brew upgrade $formula
done
