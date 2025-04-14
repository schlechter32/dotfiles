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
function nsh-add() {
    local key_name="$1"
    local fifo=$(mktemp -u)
    trap 'rm -f "$fifo"' EXIT
    mkfifo -m 600 "$fifo"
    pass "ssh/$key_name" > "$fifo" & ssh-add "$fifo"
}
function tc {
  local GHOSTTY_DIR="$HOME/dotfiles_ikr/.config/ghostty"
  local CMD="sed -i '' 's:\(config-file = {1}\)/.*:\1/{2}:' $GHOSTTY_DIR/config && osascript -so -e 'tell application \"Ghostty\" to activate' -e 'tell application \"System Events\" to keystroke \",\" using {command down, shift down}'"
  fd -L \
    --type f \
    --exclude 'config' \
    --base-directory $GHOSTTY_DIR \
  | fzf \
    --preview "cat $GHOSTTY_DIR/{}" \
    --delimiter=/ \
    --bind="enter:become:$CMD"
}
