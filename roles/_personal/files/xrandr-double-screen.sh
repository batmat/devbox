#!/bin/bash

xrandr --output LVDS1 --off
xrandr --output HDMI3 --auto --right-of HDMI2
xrandr --output HDMI2 --auto --left-of HDMI3

# Weird, but e.g. after disconnecting from a videoprojector, disconnected screens
# still seem to be taken in account by lxrandr, for one, to switch mode
# So, if disconnected, we explicitly set it off (fixes that issue for my setup)
for out in $(xrandr| grep disconnected | awk '{ print $1 }')
do
  xrandr --output $out --off
done
