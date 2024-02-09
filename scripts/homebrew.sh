#!/bin/bash -e

which -s brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
which -s brew && brew update
brew bundle
