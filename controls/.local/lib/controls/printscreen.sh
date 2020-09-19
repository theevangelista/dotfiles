#!/bin/sh

alias print-window='maim -i $(xdotool getactivewindow) ~/Pictures/$(date +%s).png'
alias printscreen='maim ~/Pictures/sc-$(date +%s).png'