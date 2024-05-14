#!/bin/bash
TOPMARGIN=10
RIGHTMARGIN=10
LEFTMARGIN=10
BOTTOMMARGIN=10

while : ; do
    SCREEN_WIDTH=$(xwininfo -root | awk '$1=="Width:" {print $2}')
    SCREEN_HEIGHT=$(xwininfo -root | awk '$1=="Height:" {print $2}')
    window_size=$(wmctrl -l -x -G | grep dev.warp.Warp.dev.warp.Warp | awk '{print $3}')
    if [[ $window_size  -eq 0 ]]; then
        W=$(( $SCREEN_WIDTH - $RIGHTMARGIN - $LEFTMARGIN))
        H=$(( $SCREEN_HEIGHT - $TOPMARGIN - $BOTTOMMARGIN))
        echo "MAX"
        wmctrl -r :ACTIVE: -b remove,maximized_vert
        wmctrl -r :ACTIVE: -b remove,maximized_horz
        wmctrl -r :ACTIVE: -e 0,$TOPMARGIN,$LEFTMARGIN,$W,$H
    fi
    sleep 3
done