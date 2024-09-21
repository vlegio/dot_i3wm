#!/bin/sh
COMMAND=$(xset -q | grep LED | awk '{ print $10 }')

case "$COMMAND" in

 "00000000"|"00000001" | "00000002" | "00000003") LAYOUT="EN" ;;

 "00001004"|"00001005" | "00001006" | "00001007") LAYOUT="RU" ;;

  *) LAYOUT="??" ;;

esac

echo $LAYOUT
