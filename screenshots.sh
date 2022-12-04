#!/bin/bash

save_location="$HOME/Pictures/Screenshots"
screenshot_path="$save_location/$(date +'%Y-%m-%d-%H%M%S').png"
screen='Screen'
area='Area'
window='Window'
gif='GIF'
chosen=$(printf '%s;%s;%s;%s\n' "$screen" "$area" "$window" "$gif" \
     | rofi -dmenu \
            -sep ';' \
            -selected-row 1)
case "$chosen" in
     "$screen") extra_args='--delay=1' ;;
     "$area")   extra_args='--delay=0.1 --select --highlight --color=0.85,0.87,0.91,0.2' ;;
     "$window") extra_args="--delay=1 --window=$(xdotool getactivewindow)" ;;
     "$gif") peek & exit  ;; 
     *)         exit 1 ;;
esac # The variable is used as a command's options, so it shouldn't be quoted. # shellcheck disable=2086
maim --hidecursor --quiet --quality=3 --format='png' $extra_args "$screenshot_path" && {
     dunstify --icon=$screenshot_path "Screenshot"  "Screenshot saved"
     xclip -selection clipboard -target 'image/png' -in "$screenshot_path"
 }
