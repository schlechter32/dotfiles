# Aliases
alias z="zellij"
alias i="ish"
alias finder="open -a finder"
alias za="zellij attach"
alias zl="zellij list-sessions"
alias ka="sudo kanata --quiet --cfg ~/dotfiles_ikr/kanata.kbd&"
alias smi="watch -n0.1 nvidia-smi"
alias studenttopics="PoolEditor SPT"
alias studentproject="PoolEditor SPP"
alias sc="st cd"
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias seu="setxkbmap eu"
alias sde="setxkbmap de"
alias sudo='sudo '
alias v="nvim"
alias ls="eza --icons --group --header --mounts --created "
alias ll="ls -l"
alias vim="nvim"
alias c="clear"
# alias cat="bat"
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

# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init - | sed s/precmd/precwd/g)"
alias c9="nsh n9"
