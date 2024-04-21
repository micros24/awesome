#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
run "dbus-update-activation-environment" --systemd XDG_CURRENT_DESKTOP
run "pcmanfm-qt" -d
run "picom" -b
run "/home/micro/.config/polybar/launch.sh"
run "blueman-applet"
run "xiccd"
run "xfce4-clipman"
run "easyeffects" --gapplication-service
run "nm-applet" --indicator
run "psensor"
run "nitrogen" --restore
run "corectrl"
run "steam-native" -silent
# run "cachy-browser"
