#!/bin/bash
if test -f "/sys/class/power_supply/BAT1/capacity"; then

BAT=$(acpi -b | awk -F ": " '{print $2}')

# Full and short texts
echo "BAT: $BAT"
fi
exit 0
