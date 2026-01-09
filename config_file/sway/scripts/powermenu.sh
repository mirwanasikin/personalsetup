#/usr/bin/env bash

choice=$(
  printf
  "Shutdown\nRestart\nSuspend\nLogout" | rofi -dmenu -i -p "Power"
)

case "$choice" in
Shutdown)
  systemctl poweroff
  ;;
Restart)
  systemctl reboot
  ;;
Suspend)
  systemctl Suspend
  ;;
Logout)
  swaymsg exit
  ;;
esac
