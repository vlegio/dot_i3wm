#!/bin/bash
i3lock -i ~/.config/i3/background.png ; conky -c ~/.config/i3/lockconky.cfg -w $(xwininfo -name i3lock | awk '/xwininfo/ {print $4}') -d
if [ -n "$1" ]; then
	sleep 1;
	case "$1" in
		"Hibernate") systemctl hibernate ;;
		"Halt") systemctl halt ;;
		"Reboot" ) systemctl reboot;;
		"Suspend" ) systemctl suspend-then-hibernate ;;
	esac
fi;
