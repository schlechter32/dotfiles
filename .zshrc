# Set the GPG_TTY to be the same as the TTY, either via the env var
# or via the tty command.
# if [ -n "$TTY" ]; then
#   export GPG_TTY=$(tty)
# else
#   export GPG_TTY="$TTY"
# fi
#
# # SSH_AUTH_SOCK set to GPG to enable using gpgagent as the ssh agent.
# export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
# gpgconf --launch gpg-agent

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="/usr/local/bin:/usr/bin"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/homebrew/bin:$PATH"
export PATH="$HOME/homebrew/sbin:$PATH"
export PATH="$HOME/execs/node-v20.11.0-linux-x64/bin:$PATH"
export PATH="$HOME/execs:$PATH"
export PATH="$HOME/nbin:$PATH"
export PATH="$HOME/opt:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.juliaup/bin:$PATH"


# Exprot variables
export NPM_PACKAGES="$HOME/.npm-packages"
export NODE_PATH="$HOME/.node/lib/node-modules"
export NODE_MAN_PATH="$HOME/.node/share/man"
export EDITOR="nvim"
export PYENV_ROOT="$HOME/.pyenv"

if [[ $(hostname) == *"cnode"* ]]; then

export JULIAUP_DEPOT_PATH="/u/bulk/home/wima/nclshrnk/julia/"
export JULIA_DEPOT_PATH="/u/bulk/home/wima/nclshrnk/julia/"
else
export JULIAUP_DEPOT_PATH="$HOME/.julia/"
export JULIA_DEPOT_PATH="$HOME/.julia/"
fi
# Initialization of Completions
autoload -Uz compinit && compinit


ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light ohmyzsh/ohmyzsh
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit snippet OMZP::git
zinit snippet OMZP::sudo
# zinit snippet OMZP::aws
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::kubectx
zinit snippet OMZP::rust
# zinit snippet OMZP::fzf
zinit snippet OMZP::command-not-found

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

source $HOME/.profile
# source $HOME/.config/tmuxinator/tmuxinator.zsh

# if [ Darwin = `uname` ]; then
#   source $HOME/.profile-macOS
# elif [ Linux = `uname` ]; then
#   source $HOME/.profile-linux
# fi

setopt auto_cd
# export LD_LIBRARY_PATH=/usr/local/lib

#export PATH="/usr/local/opt/curl/bin:$PATH"
# export PATH="$PATH:/home/elliott/Library/flutter/bin"
# Externals setup
# Aliases
alias sudo='sudo '

# Capslock command
# alias capslock="sudo killall -USR1 caps2esc"

alias v="nvim"
alias ls="exa"
alias vim="nvim"
alias c="clear"
alias cat="bat"
alias tmux='tmux -u' 
alias la='ls -a'
alias ch='cat /sys/class/power_supply/BAT0/uevent' 
alias cal='chromium --app=https://outlook.live.com/calendar/0/view/week'
alias lg='lazygit'
alias tl='tmux list-sessions'
alias ta='tmux attach-session'
alias du="dust"
alias hf="history | fzf"
alias z="__zoxide_z"
alias zi="__zoxide_zi"
alias cf="cd \$(find * -type d | fzf)"
# alias ff='fzf --preview=\"bat --color=always --style=plain {} --bind k:preview-up, j:preview-down\"'
alias ff='fzf --preview="bat --color=always --style=plain {}" --bind "k:preview-up,j:preview-down"'
alias vf="v \$(ff)"

alias echopath="echo \"$PATH\" | tr ':' '\n'"
# Completions
#
#
# source <(doctl completion zsh)

# source <(kubectl completion zsh)

# P10k customizations
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Fix for password store
# export PASSWORD_STORE_GPG_OPTS='--no-throw-keyids'

# export NVM_DIR="$HOME/.nvm"                            # You can change this if you want.
# export NVM_SOURCE="/usr/share/nvm"                     # The AUR package installs it to here.
# [ -s "$NVM_SOURCE/nvm.sh" ] && . "$NVM_SOURCE/nvm.sh"  # Load N
#
# bindkey "^P" up-line-or-beginning-search
# bindkey "^N" down-line-or-beginning-search
my_tms_command(){
tms
}
zle -N my_tms_command
bindkey "^f" my_tms_command
bindkey -M menuselect "\r" .accept-line

# [ -s "/home/elliott/.svm/svm.sh" ] && source "/home/elliott/.svm/svm.sh"


# if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
#     export MOZ_ENABLE_WAYLAND=1
# fi
 
eval "$(zoxide init zsh)"
