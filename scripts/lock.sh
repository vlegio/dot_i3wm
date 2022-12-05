#!/bin/bash
i3lock -i ~/.config/i3/static/background.png ; conky -c ~/.config/i3/configs/lockconky.cfg -w $(xwininfo -name i3lock | awk '/xwininfo/ {print $4}') -d
