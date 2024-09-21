#!/bin/bash
i3lock -i ~/.config/i3/static/background.png 
pid=$$

log() {
    echo "$(date "+%Y-%m-%d %H:%M:%S") - $1"
}
conky -c ~/.config/i3/configs/lockconky.cfg -w $(xwininfo -name i3lock | awk '/xwininfo/ {print $4}') -d
dunsctl set-paused true
while ps -p "$pid" > /dev/null; do
    out=$(fprintd-verify 2>&1)
    log "Fingerscan start"
    if echo "$out" | grep -q "verify-match"; then
        log "Fingerprint matched!"
        pkill -f "i3lock.*"
        break
    else
        log "Fingerprint not matched."
    fi
done
dunsctl set-paused false
