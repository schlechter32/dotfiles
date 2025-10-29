#!/bin/bash
APP_PATH="$1"
WMCLASS="$2"
shift 2
ARGS="$@"
wmctrl="/u/home/wima/nclshrnk/localapps/bin/wmctrl"

if $wmctrl -lx | grep -q "$WMCLASS"; then
    WIN_ID=$($wmctrl -lx | grep "$WMCLASS" | awk '{print $1}')
    ACTIVE_ID=$(xprop -root _NET_ACTIVE_WINDOW | awk -F'#' '{print $2}' | awk '{print $1}' | tr -d ',')
    if [[ "${WIN_ID#0x0}" == "${ACTIVE_ID#0x}" ]]; then
        $wmctrl -ir "$ACTIVE_ID" -b add,hidden
    else
        $wmctrl -xa "$WMCLASS"
    fi
else
    nohup "$APP_PATH" $ARGS >/dev/null 2>&1 &
fi
