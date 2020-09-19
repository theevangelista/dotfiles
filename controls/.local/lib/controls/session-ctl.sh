#!/bin/sh

# Aliases to control the session lock and power.

alias lock='loginctl lock-session'
alias suspend='slock && systemctl suspend'
alias hiber='slock && systemctl hibernate'
alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'