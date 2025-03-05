export EDITOR=nvim
GPG_TTY=$(tty)
export GPG_TTY
# PATHS
source $HOME/dotfiles_ikr/zsh/paths.zsh
source $HOME/dotfiles_ikr/zsh/homebrew.zsh

export TMS_CONFIG_FILE="$HOME/.config/tms/config.toml"
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light jeffreytse/zsh-vi-mode

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit 
compinit

zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt auto_cd

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


source $HOME/dotfiles_ikr/zsh/aliases.zsh
source $HOME/dotfiles_ikr/zsh/functions.zsh
source $HOME/dotfiles_ikr/zsh/ikrhosts.zsh

if [[ $(uname) == "Darwin" ]]; then
    alias nsh="nsh-darwin-arm64" 
else
    alias nsh="nsh-linux-amd64" 
fi

# Shell integrations
eval "$(zoxide init zsh --cmd cd)"
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
# Secrets
if [ -f "$HOME/.secrets" ]; then
source ~/.secrets
fi
# Shortcuts
function zvm_after_init() {
    bindkey '^p' history-search-backward
    bindkey '^n' history-search-forward
    bindkey '^[w' kill-region
    bindkey '^g' autosuggest-execute
    bindkey '^e' autosuggest-accept
    bindkey '^u' autosuggest-toggle
}
zvm_after_init
