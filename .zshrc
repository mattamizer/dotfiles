# Turn on case sensitivity, which is apparently a thing in OS X
CASE_SENSITIVE=true
# Use VI keybinds, but keep ^r for backwards search
set -o vi
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

# Configure zsh to understand where brew is
eval $(/opt/homebrew/bin/brew shellenv)
export HOMEBREW_BUNDLE_FILE=$HOME/.config/brewfile/Brewfile
# Mess with PATH
export GOPATH=$HOME/gocode
export PATH=$PATH:$GOPATH/bin:$GOPATH/src
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/go/bin:$PATH"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Docker using Colima
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# rbenv
eval "$(rbenv init - zsh)"

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Starship (https://starship.rs/) shell prompt
# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || \
  {
    echo "Load starship"
    eval "$(starship init zsh)"
  }

# Syntax highlights
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zoxide (https://https://github.com/ajeetdsouza/zoxide/tree/main)
eval "$(zoxide init zsh)"

# Work specific stuff
export VAULT_ADDR=https://or.vault.comcast.com

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
