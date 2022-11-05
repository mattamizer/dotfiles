#!/bin/bash -e

xcode-select --install || echo "Tools already installed, nothing to do."

# Install homebrew and a bunch of taps
if [ -a homebrew.sh ]; then
  ./homebrew.sh
fi

# Install Zpresto
if [ -a prezto.sh ]; then
  ./prezto.sh
fi

# Install SDKMAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"


mkdir -p ~/.config
mkdir -p ~/.vim/backup
mkdir -p "${XDG_CONFIG_HOME:=$HOME/.config}"
mkdir -p ~/code
mkdir -p ~/gocode/src/

ln -fs ~/.dotfiles/.agignore ~/.agignore
ln -fs ~/.dotfiles/.aliases ~/.aliases
ln -fs ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -fs ~/.dotfiles/flake8 ~/.config/flake8

bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
cp -r config/ "$HOME/.config/"


# git
git config --global alias.amend 'commit --amend --reuse-message HEAD'
git config --global alias.changed 'diff --name-only origin/master..HEAD'
git config --global alias.changelog 'log --no-merges --pretty=format:"%s (%an)"'
git config --global alias.contributors 'shortlog --summary --email --numbered'
git config --global alias.edit '"!vim `git ls-files -m` -p"'
git config --global alias.graph 'log --all --date=relative --decorate --graph --oneline'
git config --global alias.ignore '!gitignoreio() { curl https://www.gitignore.io/api/$@ ;}; gitignoreio'
git config --global alias.yolo 'push --force --no-verify'
git config --global alias.co 'checkout'
git config --global alias.cob 'checkout -b'
git config --global alias.it 'fetch --all --prune --tags --recurse-submodules'
git config --global merge.tool diffconflicts
git config --global mergetool.diffconflicts.cmd 'vim -c DiffConflicts "$MERGED" "$BASE" "$LOCAL" "$REMOTE"'
git config --global mergetool.diffconflicts.trustExitCode true
git config --global mergetool.keepBackup false
# Hub alias, but whatever
git config --global alias.pr 'pull-request'
git config --global color.ui true
git config --global core.editor "vim"
git config --global core.excludesfile ~/.gitignore
git config --global github.user "mattamizer"
git config --global help.autocorrect 25
git config --global pull.ff only
git config --global push.default current
git config --global user.email "mattamizer@pm.me"
git config --global user.name "Matthew Morrissey"
git config --global web.browser open
git config --global credential.helper osxkeychain

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
