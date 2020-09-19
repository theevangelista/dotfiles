#!/bin/sh

# Controls for display positioning

LAPTOP='eDP-1'
MONITOR='DP-1'
HDMI='HDMI-1'
alias monitor-left="xrandr --output $MONITOR --auto --left-of $LAPTOP"
alias monitor-right="xrandr --output $MONITOR --auto --right-of $LAPTOP"
alias monitor-presentation="xrandr --output $HDMI --auto --same-as $LAPTOP"
# alias monitor-off="xrandr --output $MONITOR --off"