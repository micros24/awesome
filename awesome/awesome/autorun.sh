#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}
run "/usr/lib/polkit-kde-authentication-agent-1"
run "dbus-update-activation-environment" --systemd XDG_CURRENT_DESKTOP
run "picom" -b --config /home/micro/.config/picom/picom.conf
run "sleep" 2
run "blueman-applet"
run "xiccd"
run "xfce4-clipman"
run "easyeffects" --gapplication-service
run "nm-applet" --indicator
run "psensor"
run "nitrogen" --restore
run "corectrl"
run "pcmanfm-qt" --daemon-mode
run "firefox"
