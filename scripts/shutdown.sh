#!/bin/bash
set -o errexit

HALT="⏻ Halt"
REBOOT="⏽ Reboot"
HIBERNATE="鈴 Hibernate"
SUSPEND=" Suspend"
INPUT=$(printf '%s;%s;%s;%s\n' "$HALT" "$REBOOT" "$HIBERNATE" "$SUSPEND" \
     | rofi -dmenu \
            -mesg Power \
            -p action \
            -sep ';' \
            -selected-row 1)
INPUT=$(echo -ne $COMMANDS |  rofi -dmenu -mesg PowerOff -p power -only-match )
exec ~/.config/i3/scripts/lock.sh &
sleep 1;
case "$INPUT" in
    "$HIBERNATE") systemctl hibernate ;;
    "$HALT") systemctl halt ;;
    "$REBOOT" ) systemctl reboot;;
    "$SUSPEND" ) systemctl suspend-then-hibernate ;;
esac
