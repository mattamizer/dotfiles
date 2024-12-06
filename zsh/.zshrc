# Turn on case sensitivity, which is apparently a thing in OS X
CASE_SENSITIVE=true
# Use VI keybinds, but keep ^r for backwards search
set -o vi
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

# Set the default editor to Neovim
export EDITOR="nvim"

# Mess with PATH
export GOPATH=$HOME/gocode
export PATH=$PATH:$GOPATH/bin:$GOPATH/src
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/go/bin:$PATH"

# aliases
[[ -f ~/.config/.aliases ]] && source ~/.config/.aliases

# wezterm zsh integration
[[ -f ~/dotfiles/scripts/wezterm.sh ]] && source ~/dotfiles/scripts/wezterm.sh

# Custom functions
branch() { git checkout ${1:-$(git branch | grep -v "^* "| pick)} ;}
code() { cd ~/Code; cd ${1:-$(eza -a ~/code | pick)} ;}
gocode() {
  cd $GOPATH/src/${1:-$(
  find $GOPATH/src -type d -maxdepth 3 | \
    grep "src/.*/.*/.*$" | \
    cut -f 6-9 -d "/" | \
    pick
  )}
}
cx() { cd "$@" && l; }

# Add fuzzy finding
eval "$(fzf --zsh)"

# Docker using Colima
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"

# Syntax Highlighting and Autosuggestions
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# More autocomplete
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

autoload -Uz compinit

for dump in $HOME/.config/zsh/.zcompdump(N.mh+24); do
    compinit
done

compinit -C

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# assumes the virtualenv plugin is installed
# https://github.com/pyenv/pyenv-virtualenv?tab=readme-ov-file#installing-with-homebrew-for-macos-users
eval "$(pyenv virtualenv-init -)"

# NVM configuration
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Starship (https://starship.rs/) shell prompt
# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
export STARSHIP_CONFIG=~/.config/starship/starship.toml
type starship_zle-keymap-select >/dev/null || \
  {
    echo "Load starship"
    eval "$(starship init zsh)"
  }

# zoxide (https://https://github.com/ajeetdsouza/zoxide/tree/main)
eval "$(zoxide init zsh)"
