#!/bin/bash -e

which -s brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
which -s brew && brew update
brew bundle
