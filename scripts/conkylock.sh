#!/bin/bash

i3lock &
i3lockpid=$!
sleep 0.5

winid=`xwininfo -name "i3lock" | grep "Window id" | grep -oE "0x[0-9a-f]+"`
if [ -z "$winid" ]
then
    echo "Could not find i3lock window"
    exit 1
fi

conky -w "$winid" -c ~/.config/i3/lockconky.cfg &
conkypid=$!

wait $i3lockpid
kill $conkypid
