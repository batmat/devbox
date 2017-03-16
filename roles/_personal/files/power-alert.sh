#!/bin/bash
set -euo pipefail

# unsetting PATH to be closer to cron env/behaviour
unset PATH
export PATH=/bin

export DISPLAY=:0
export output="$( /usr/bin/upower -i /org/freedesktop/UPower/devices/battery_BAT0 )"
export state=$( echo "$output" | grep state: | tr -s ' ' | cut -d' ' -f3 )

if [[ $state = "charging" ]]; then
  echo "Battery in charge, no analysis to do, exiting"
  exit 0
fi

currentBattery=$( echo "$output" | /bin/grep percentage | /bin/tr -s ' ' | /bin/cut -d ' ' -f3 | /bin/sed 's/%//' )
if [[ $currentBattery -lt 7 ]]; then
  /usr/bin/notify-send --urgency critical -t 2000 'BATTERY: CHARGE NAOW !!!' 'Woooohoooo, now!... That thing on the left, you know'
  /bin/sleep 15
  /usr/bin/notify-send --urgency critical -t 5000 'BATTERY: CHARGE NAOW !!!' 'Woooohoooo, now!... That thing on the left, you know'
elif [[ $currentBattery -lt 10 ]]; then
  /usr/bin/notify-send -t 2000 'BATTERY: Time to charge' 'Woooohoooo, now... That thing on the left, you know'
elif [[ $currentBattery -lt 15 ]]; then
  /usr/bin/notify-send --urgency low -t 1000 'BATTERY: Time to think about charging'
fi
