#!/bin/sh

LOG=~/startup.log
touch $LOG

function ensure_killed {
    killall -q $1
    while pgrep -u $UID -x $1 >/dev/null; do sleep 1; done
}

function log {
    echo $1 >> $LOG
}

function run {
   nohup $@ &>/dev/null
}

log  'Launching Picom'
ensure_killed picom
run picom -b 
log 'Picom launched'

log 'Launching Polybar'
ensure_killed polybar
run polybar mainbar
log 'Polybar launched'

log 'Configuring keyboard'
setxkbmap -layout br,us -variant ,intl grp:alt_shift_toggle

log 'Starting Polkit'
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

log 'Restoring wallpaper'
run nitrogen --restore

log 'Startup successful'
exit 0