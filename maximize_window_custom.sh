# MAXIMIZE and MAXIMIZE_NAME are exported by the calling script
# This script will check against the container OS to do the right thing.
enable_x=0
TOPMARGIN=10
RIGHTMARGIN=10
LEFTMARGIN=10
BOTTOMMARGIN=10
maximize_window(){
    set +e
    if [[ ${MAXIMIZE} == 'true' ]] ; then
        if [[ $- =~ x ]] ;
        then
            set +x
            enable_x=1
        fi
        while true; do
            end=$((SECONDS+60))
            while [ $SECONDS -lt $end ]; do
                SCREEN_WIDTH=$(xwininfo -root | awk '$1=="Width:" {print $2}')
                SCREEN_HEIGHT=$(xwininfo -root | awk '$1=="Height:" {print $2}')
                W=$(( $SCREEN_WIDTH - $RIGHTMARGIN - $LEFTMARGIN))
                H=$(( $SCREEN_HEIGHT - $TOPMARGIN - $BOTTOMMARGIN))
                wmctrl -x -a dev.warp.Warp.dev.warp.Warp && wmctrl -r :ACTIVE: -e 0,$TOPMARGIN,$LEFTMARGIN,$W,$H
                break;
                sleep 1
            done
            sleep 10
        done
        if [[ ${enable_x} -eq 1 ]];
        then
            set -x
        fi
    fi
    set -e
}

maximize_window