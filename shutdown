#!/bin/bash
set -o errexit

COMMANDS="Halt\nReboot\nHibernate\nSuspend\nExit"

INPUT=$(echo -ne $COMMANDS |  rofi -dmenu -mesg PowerOff -p power -only-match )
if [ "$INPUT" = "Exit" ]; then
	return 0;
fi
DISPLAY=:0
exec ~/.config/i3/lock.sh $INPUT 
