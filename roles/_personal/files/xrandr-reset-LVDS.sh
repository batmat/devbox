#!/bin/bash

export DISPLAY=:0

if [[ $( xrandr  | grep " connected" | wc -l ) -le 1 ]]; then
  #echo "Aucun autre écran allumé, allumage LCD et off des autres"
  xrandr --output eDP-1 --auto
  xrandr --output DP-1 --off
  xrandr --output HDMI-1 --off
  xrandr --output DP-2 --off
  xrandr --output HDMI-2 --off
else
  echo "Autres écrans allumés"
fi
