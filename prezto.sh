#!/bin/bash

git clone --recursive get@github.com:mattamizer/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
shopt -s extglob
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
echo "Run 'chsh -s /bin/zsh' if you haven't already."
