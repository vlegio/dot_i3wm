#!/bin/bash

BAT=$(acpi -b | awk -F ": " '{print $2}')

# Full and short texts
echo "BAT: $BAT"

exit 0
