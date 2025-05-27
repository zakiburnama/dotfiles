#!/bin/bash

# Options
options="🔒 Lock\n🔃 Reboot\n⏾ Suspend\n⏻ Shutdown\n🚪 Logout"

# Rofi command
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu")

# Action
case "$chosen" in
"🔒 Lock") loginctl lock-session ;;
"🔃 Reboot") systemctl reboot ;;
"⏾ Suspend") systemctl suspend ;;
"⏻ Shutdown") systemctl poweroff ;;
"🚪 Logout") loginctl terminate-session $XDG_SESSION_ID ;;
esac
