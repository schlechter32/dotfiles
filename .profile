
# export PATH="$PATH:$HOME/.local/bin"

# export PATH="$PATH:$HOME/execs"
# export PATH="$PATH:$HOME/homebrew/bin"
# export PATH="$PATH:$HOME/homebrew/sbin"

# export PATH="$PATH:$HOME/execs/node-v20.11.0-linux-x64/bin"
# export PATH="$PATH:$HOME/execs"
# NPM_PACKAGES="${HOME}/.npm-packages" 
# NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH" 
# MANPATH="$HOME/.node/share/man:$MANPATH" 
export PATH="$HOME/.cargo/bin:$PATH"
# alias c="clear"
# alias vim="nvim"
# alias v='nvim'
# alias cat="bat"
# alias tmux="tmux -u"
# alias v="nvim"
# alias ls='ls --color=auto'

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


