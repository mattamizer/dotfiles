#!/bin/bash

# Clone prezto
git clone --recursive https://github.com/mattamizer/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Install
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Set zsh as the default shell
chsh -s /bin/zsh
