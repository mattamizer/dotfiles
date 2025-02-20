# dotfiles

Dotfiles to configure all the things

## Prerequisites

- [brew](brew.sh)

## Usage

Clone the repository, ex `git clone git@github.com:mattamizer/dotfiles.git`
Once that's done, do the following.

```bash
cd dotfiles
stow .
brew bundle install
sh scripts/git.sh
```

## Migrating to a new machine

Make sure to run `brew bundle dump` before you move to a new machine.
