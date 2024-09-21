#!/bin/bash
set -o errexit

HISTORY="$HOME/.drun_history"
LOG="$HOME/.drun_log"
THEME="$HOME/.config/i3/static/launcher/launcher.rasi"
test -f "$HISTORY" || touch "$HISTORY"
INPUT=$(rofi -dmenu -theme $THEME -p app < "$HISTORY")
test -n "$INPUT"

# aliases
case "$INPUT" in
    telegram)
        CMD="~/Telegram/Telegram" ;;
    mattermost)
        CMD="cd ~/Mattermost && ~/Mattermost/mattermost-desktop" ;;
    mpd)
	CMD="uxterm -class MPD /usr/bin/ncmpcpp" ;;
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
echo $CMD > $LOG
bash -c "$CMD" > $LOG
