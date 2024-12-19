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

# Add fuzzy finding
eval "$(fzf --zsh)"
[ -f ~/dotfiles/scripts/fzf-git.sh ] && source ~/dotfiles/scripts/fzf-git.sh
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--color=selected-bg:#494d64 \
--multi"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"

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

for dump in $XDG_CONFIG_HOME/zsh/.zcompdump(N.mh+24); do
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
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Starship (https://starship.rs/) shell prompt
# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
eval "$(starship init zsh)"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

# zoxide (https://https://github.com/ajeetdsouza/zoxide/tree/main)
eval "$(zoxide init zsh)"

# Created by `pipx` on 2024-11-26 21:27:58
export PATH="$PATH:/Users/mmorrissey/.local/bin"
