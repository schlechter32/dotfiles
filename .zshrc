# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

BULK_HOME="/u/bulk/home/wima/$USER"
LAB_BULK_HOME="/home/bulk"
export EDITOR=nvim
if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
if [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]] then
  # If you're using linux, you'll want this enabled
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [[ $(hostname) == *"cnode"* ]]; then

export JULIAUP_DEPOT_PATH="$BULK_HOME/julia/"
export JULIA_DEPOT_PATH="$BULK_HOME/julia/"
# export PYENV_ROOT="$BULK_HOME/.pyenv"

export ST_PATH=/u/home/wima/nclshrnk/source/SimTree_wrapper
function st(){
    source /u/home/wima/nclshrnk/source/SimTree_wrapper/st_wrapper.bash
}
elif [[ $(hostname) == *"pc"* ]]; then

export ST_PATH=/u/home/wima/nclshrnk/source/SimTree_wrapper
function st(){
    source /u/home/wima/nclshrnk/source/SimTree_wrapper/st_wrapper.bash
}
elif [[ $(hostname) == *"cobra"* ]]; then

# export JULIAUP_DEPOT_PATH="$LAB_BULK_HOME/.julia/"
# export JULIA_DEPOT_PATH="$LAB_BULK_HOME/.julia/"

export ST_PATH=$HOME/source/simtree_wrapper
function st(){
    source $HOME/source/simtree_wrapper/st_wrapper.bash
}
else
export JULIAUP_DEPOT_PATH="$HOME/.julia/"
export JULIA_DEPOT_PATH="$HOME/.julia/"

# else
# git config --global  http.http://gitlab/.proxy socks5h://127.0.0.1:8080
# git config --global  http.http://appsrv2/.proxy socks5h://127.0.0.1:8080
# fi
# export PYENV_ROOT="$HOME/.pyenv"
fi
# PATHS
#
export PATH="/usr/local/bin:/usr/bin:$PATH"

export PATH="/usr/local/sbin:/usr/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

export PATH="/home/nhornek/zephyr-sdk-0.16.3/sysroots/x86_64-pokysdk-linux/usr/bin/:$PATH"
export PATH="/usr/local/tde/curr/bin:$PATH"
export PATH="/ext/bin:$PATH"

export PATH="/Library/TeX/texbin/:$PATH"
export PATH="/usr/games:$PATH"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/homebrew/bin:$PATH"
export PATH="$HOME/homebrew/sbin:$PATH"
export PATH="$HOME/execs/node-v20.11.0-linux-x64/bin:$PATH"
export PATH="$HOME/execs:$PATH"
export PATH="$HOME/nbin:$PATH"
export PATH="$HOME/opt:$PATH"
# export PATH="$PYENV_ROOT/.pyenv/bin:$PATH"
export PATH="$HOME/.juliaup/bin:$PATH"
# Variables
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light jeffreytse/zsh-vi-mode

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
# zinit snippet OMZP::archlinux
# zinit snippet OMZP::aws
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit 
compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
# bindkey -e
# bindkey '^L' vi-forward-word

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
# OS dependent execs
#
if [ Darwin = `uname` ]; then

export PATH="/Users/nicolashornek/.local/share/nvim/lazy/nvim-texlabconfig:$PATH"

elif [ Linux = `uname` ]; then
# alias yq="yq_amd64"
fi

# Aliases
#
#
#
#
alias ka="sudo kanata --quiet --cfg ~/dotfiles_ikr/kanata.kbd&"
alias smi="watch -n0.1 nvidia-smi"
alias studenttopics="PoolEditor SPT"
alias studentproject="PoolEditor SPP"
alias sc="st cd"
alias ls='ls --color'
alias vim='nvim'
alias c='clear'

alias sudo='sudo '
alias v="nvim"
alias ls="eza --icons --group --header --mounts --created "
alias ll="ls -l"
alias vim="nvim"
alias c="clear"
alias cat="bat"
# alias tmux='tmux -u' 
alias la='ls -a'
alias lla="ls -alh"
alias ch='cat /sys/class/power_supply/BAT0/uevent' 
alias cal='chromium --app=https://outlook.live.com/calendar/0/view/week'
alias lg='lazygit'
alias tl='tmux list-sessions'
alias ta='tmux attach-session'
alias hf="history | fzf"
alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."
alias cf="cd \$(find * -type d | fzf)"

alias or="v $HOME/secondBrain/00inbox/*.md"
alias notionsync="python ~/source/notionsync/notionsync.py"
# alias ff='fzf --preview=\"bat --color=always --style=plain {} --bind k:preview-up, j:preview-down\"'
# alias ff='fzf --preview="bat --color=always --style=plain {}" --bind "k:preview-up,j:preview-down"'

alias ff='fzf --preview="bat --color=always --style=plain {}"'
# alias ff='fzf --preview="bat --color=always --style=plain --line-range=:100000 {}" --bind "k:preview-up,j:preview-down,e:execute(bat --color=always --style=plain --line-range=:100000 {})"'
alias vf="v \$(fzf --preview='bat --color=always --style=plain {}')"
alias nhmail="mutt -f .IncomingMail.d/"
alias j="julia"
alias sf="sf_script.sh"

# Update all submodules
alias gsu='git submodule update --init --recursive'

# Add changes in submodules
alias gsa='git submodule foreach git add .'

# Commit changes in submodules
alias gsm='git submodule foreach git commit -am'

# Push changes in submodules
alias git-submodule-push='git submodule foreach git push'
alias echopath="echo \"$PATH\" | tr ':' '\n'"
# Shell integrations
eval "$(fzf --zsh)"

# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init - | sed s/precmd/precwd/g)"

# Make nice tree
function lt() {
  if [ -z "$1" ]; then
    eza --icons -T -L 2
  else
    eza --icons -T -L "$1"
  fi
}

function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    # echo $cwd
		cd "$cwd"
	fi
	rm -f -- "$tmp"

}
eval "$(zoxide init zsh --cmd cd)"
alias z="cd"
alias c9="nsh -D 8080 icnode09"
source ~/.secrets
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
# fsshmap multiple ports
function fsshmap() {
  echo -n "-L 1$1:127.0.0.1:$1 " > $HOME/sh/sshports.txt
  for ((i=($1+1);i<$2;i++))
  do
    echo -n "-L 1$i:127.0.0.1:$i " >> $HOME/sh/sshports.txt
  done
  line=$(head -n 1 $HOME/sh/sshports.txt)
  cline="nsh "$3" "$line
  echo $cline
  eval $cline
}
function tnl {
  TUNNEL="nsh -N"
  echo Port forwarding for ports:
  for i in ${@:2}
  do
    echo " - $i"
    TUNNEL="$TUNNEL -L $i"
    # echo $TUNNEL
  done
  TUNNEL="$TUNNEL $1"
  eval "$TUNNEL &"
  PID=$!
  alias tnlkill="kill $PID && unalias tnlkill"
}
function zvm_after_init() {
    bindkey '^p' history-search-backward
    bindkey '^n' history-search-forward
    bindkey '^[w' kill-region
    bindkey '^g' autosuggest-execute
    bindkey '^e' autosuggest-accept
    bindkey '^u' autosuggest-toggle
}
zvm_after_init
# bindkey '^p' history-search-backward
# bindkey '^n' history-search-forward
# bindkey '^[w' kill-region
# bindkey '^g' autosuggest-execute
# bindkey '^e' autosuggest-accept
# bindkey '^u' autosuggest-toggle
