#!/usr/bin/env bash

# Terminate existing instances
killall -q polybar

# Wait until processes shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch on all monitors
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar main --log=info 2>&1 | tee -a /tmp/polybar.log & disown
done

