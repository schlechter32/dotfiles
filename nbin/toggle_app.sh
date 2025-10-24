#!/bin/bash
APP_PATH="$1"
WMCLASS="$2"
# wmctrl="/u/home/wima/nclshrnk/execs/wmctrl"
shift 2
ARGS="$@"

if /u/home/wima/nclshrnk/execs/wmctrl -lx | grep -q "$WMCLASS"; then
    /u/home/wima/nclshrnk/execs/wmctrl -xa "$WMCLASS"
else
    nohup "$APP_PATH" $ARGS >/dev/null 2>&1 &
fi
