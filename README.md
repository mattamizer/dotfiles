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
xargs brew install < leaves.txt
# We need this for sketchybar to render app icons, at least for now
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.28/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
sh scripts/git.sh
brew services start sketchybar
```

## Migrating to a new machine

Make sure to run `brew leaves > ~/dotfiles/leaves.txt` before you move to a new machine.
