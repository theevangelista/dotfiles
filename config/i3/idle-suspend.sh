#!/bin/sh

xidlehook --not-when-fullscren --not-when-audio \
	# suspend after 10min
	--timer 600 'loginctl lock-screen && systemctl suspend'
