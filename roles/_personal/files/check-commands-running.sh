#!/bin/bash
set -euo pipefail

# This script checks if a given list of command is running or not, and notifies if not

# unsetting PATH to be closer to cron env/behaviour
unset PATH
export PATH=/bin
export DISPLAY=:0


export COMMANDS_TO_CHECK="rescuetime copyq xautolock"

notify ()
{
  /usr/bin/notify-send -t 3000 "Missing process: $1" "$1 is expected to always be running, but is missing, check why!"
}

for cmd in $COMMANDS_TO_CHECK
do
  if ! pgrep $cmd ; then
    notify $cmd
  fi
done
