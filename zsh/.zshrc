# Use VI keybinds, but keep ^r for backwards search
set -o vi
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

# Set the default editor to Neovim
export EDITOR="nvim"

# Setup docker options for Colima
export COLIMA_HOME=$XDG_CONFIG_HOME/colima
export DOCKER_HOST="unix://$COLIMA_HOME/default/docker.sock"

# Mess with PATH
export GOPATH=$HOME/gocode
export PATH=$PATH:$GOPATH/bin:$GOPATH/src
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/go/bin:$PATH"

# Homebrew bundle file
export HOME_BREW_BUNDLE_FILE="$XDG_CONFIG_HOME/Brewfile"

# aliases
[[ -f ~/.config/.aliases ]] && source ~/.config/.aliases

# wezterm zsh integration
[[ -f ~/dotfiles/scripts/wezterm.sh ]] && source ~/dotfiles/scripts/wezterm.sh

# Add fuzzy finding via FZF
eval "$(fzf --zsh)"
[ -f ~/dotfiles/scripts/fzf-git.sh ] && source ~/dotfiles/scripts/fzf-git.sh
# Catppuccin Macchiato
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--color=selected-bg:#494d64 \
--multi"
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# Search for a branch using fzf-git, then check it out
branch() {
  _fzf_git_branches | xargs git checkout
}

# Syntax Highlighting and Autosuggestions
source $XDG_CONFIG_HOME/zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh
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

FPATH=$FPATH:$HOME/.zfunc/
autoload -Uz compinit

for dump in $XDG_CONFIG_HOME/zsh/.zcompdump(N.mh+24); do
    compinit
done

compinit -C

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# NVM configuration
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Starship (https://starship.rs/) shell prompt
eval "$(starship init zsh)"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

# zoxide (https://https://github.com/ajeetdsouza/zoxide/tree/main)
eval "$(zoxide init zsh)"

# Created by `pipx` on 2024-11-26 21:27:58
export PATH="$PATH:/Users/mmorrissey/.local/bin"
