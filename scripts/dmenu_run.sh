#!/bin/bash
set -o errexit

HISTORY="$HOME/.drun_history"
test -f "$HISTORY" || touch "$HISTORY"
INPUT=$(rofi -dmenu -mesg RunApp -p app < "$HISTORY")
test -n "$INPUT"

# aliases
case "$INPUT" in
    telegram)
        CMD="telegram-desktop" ;;
    ide)
	CMD="/opt/jetbrains-toolbox/jetbrains-toolbox" ;;
    mpd)
	CMD="uxterm -class MPD /usr/bin/ncmpcpp" ;;
    slicer-sla)
	CMD="/usr/bin/lycheeslicer" ;;
    *)
        CMD="$INPUT" ;;
esac

# test if CMD exist in $PATH
hash $(echo "$CMD" | cut -f1 -d ' ')

# write input to history
if ! grep -q "$INPUT" "$HISTORY"; then
    echo "$INPUT" >> "$HISTORY"
    sort "$HISTORY" -o "$HISTORY" &
fi

exec $CMD
