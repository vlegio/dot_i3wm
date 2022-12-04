#!/bin/bash

runningConkys=$(pgrep -a conky | awk '/screenconky.cfg/{print $1}')

# if runningConkys is empty
if [[ -z "$runningConkys" ]]; then
    # start conky
    conky -q -c ~/.config/i3/screenconky.cfg &
else #not empty
    #Kill all of the PIDs listed in $runningConkys
    echo "$runningConkys" | xargs -n 1 kill -15
fi
