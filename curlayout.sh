#!/bin/sh
COMMAND=$(xset -q | grep LED | awk '{ print $10 }')

case "$COMMAND" in

 "00000000"|"00000001") LAYOUT="EN" ;;

 "00001004"|"00001005") LAYOUT="RU" ;;

  *) LAYOUT="??" ;;

esac

echo $LAYOUT
