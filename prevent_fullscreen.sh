#!/usr/bin/env bash

while : ; do
    SCREEN_WIDTH=$(xwininfo -root | awk '$1=="Width:" {print $2}')
    SCREEN_HEIGHT=$(xwininfo -root | awk '$1=="Height:" {print $2}')
    window_size=$(wmctrl -l -x -G | grep dev.warp.Warp.dev.warp.Warp | awk '{print $3}')
    if [[ $window_size  -eq 0 ]]; then
        WIDTH=$(( $SCREEN_WIDTH - $RIGHTMARGIN - $LEFTMARGIN))
        HEIGHT=$(( $SCREEN_HEIGHT - $TOPMARGIN - $BOTTOMMARGIN))
        wmctrl -x -a dev.warp.Warp.dev.warp.Warp
        wmctrl -r :ACTIVE: -b remove,maximized_vert
        wmctrl -r :ACTIVE: -b remove,maximized_horz
        wmctrl -r :ACTIVE: -e 0,$TOPMARGIN,$LEFTMARGIN,$WIDTH,$HEIGHT
    fi
    sleep 3
done