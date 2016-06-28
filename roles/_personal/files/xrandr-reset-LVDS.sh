#!/bin/bash

export DISPLAY=:0

if [[ $( xrandr  | grep " connected" | wc -l ) -le 1 ]]; then
  #echo "Aucun autre écran allumé, allumage LCD et off des autres"
  xrandr --output LVDS1 --auto
  xrandr --output HDMI1 --off
  xrandr --output HDMI2 --off
  xrandr --output HDMI3 --off
  xrandr --output VGA1 --off
else
  echo "Autres écrans allumés"
fi
