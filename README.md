# dotfiles

Dotfiles to configure all the things

## Prerequisites

- [brew](brew.sh)

## Usage

Clone the repository, ex `git clone git@github.com:mattamizer/dotfiles.git`
Once that's done, do the following.

```bash
cd dotfiles
cp zsh/.zshenv ~/.zshenv
brew install stow
stow .
brew bundle install
sh scripts/git.sh
```

## Post-setup

Configure git identity (not set by `scripts/git.sh`):

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

## Migrating to a new machine

Make sure to run `brew bundle dump` before you move to a new machine.
