#!/bin/bash -ex

if [ -a homebrew.sh ]; then
  ./homebrew.sh
fi

# Oh my zsh

sh -c "$(curl -fsSl https://raw.github.com/robbyrussel/oh-my-zsh/master/tools/install.sh)"

ln -fs ~/.dotfiles/.tmux.config ~/.tmux.config
ln -fs ~/.dotfiles/.vimrc ~/.vimrc
ln -fs ~/.dotfiles/.zshrc ~/.zshrc
ln -fs ~/.dotfiles/.zshrc.local ~/.zshrc.local
ln -fs ~/.dotfiles/.zsh/ ~/.zsh/

ln -fs ~/.vim ~/.nvim
ln -fs ~/.vimrc ~/.nvimrc

mkdir -p ~/code

# git
git config --global alias.amend 'commit --amend --reuse-message HEAD'
git config --global alias.changed 'diff --name-only origin/master..HEAD'
git config --global alias.changelog 'log --no-merges --pretty=format:"%s (%an)"'
git config --global alias.contributors 'shortlog --summary --email --numbered'
git config --global alias.edit '"!vim `git ls-files -m` -p"'
git config --global alias.graph 'log --all --date=relative --decorate --graph --oneline'
git config --global alias.ignore '!gitignoreio() { curl https://www.gitignore.io/api/$@ ;}; gitignoreio'
git config --global alias.yolo 'push --force --no-verify'
git config --global color.ui true
git config --global core.excludesfile ~/.gitignore
git config --global github.user "mattamizer"
git config --global help.autocorrect 25
git config --global pull.ff only
git config --global push.default current
git config --global user.email "mattamizer@gmail.com"
git config --global user.name "Matthew Morrissey"
git config --global web.browser open

# vim-plug
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
