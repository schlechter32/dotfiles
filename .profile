
export PATH="$PATH:$HOME/.local/bin"

export PATH="$PATH:$HOME/execs"

export PATH="$HOME/.cargo/bin:$PATH"
alias c="clear"
alias vim="nvim"
alias v='nvim'
alias cat="bat"
alias tmux="tmux -u"
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

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/u/home/wima/nclshrnk/.juliaup/bin:*)
        ;;

    *)
        export PATH=/u/home/wima/nclshrnk/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
