# Octtober 21, 2023

- Removed note on Hyprland as tearing have been implemented.
- Removed override-redirect from Polybar.
- Updated used packages on Hyprland.
- Renamed 10-amdgpu.conf to 20-amdgpu.conf.
- Renamed 20-multigpu.conf to 30-multigpu.conf.
- Commented browser auto-start on AwesomeWM.
  - Removed -c from picom auto-start.
- Changed layout of wleave.
- Moved environment variables to .xprofile.
  - Commented input-remapper command.
- Added notification when GameMode starts and ends.
  - Starting will 'killall picom'. Ending will start 'picom -b'.

### Hyprland

- Added keybinding to fullscreen clients (CTRL + SUPER + M).
- Added keybinding to launch browsers with 'DRI_PRIME=1 LIBVA_DRIVER_NAME=i965'.
- Added steam-native launch options to minimize resource usage (-silent starts steam minimized).
- Added per-monitor vrr.
- Added more floating clients.
- Added tearing support.
  - Guild Wars 2
  - Counter Strike 2
  - Path of Exile
- Commented all hyprload and its plugins' commands. It crashes Hyprland.
- Fixed syntax for Waybar.
- Changed wlogout to wleave.

### AwesomeWM

- Removed descriptions as I dont use them.
- Added 'DRI_PRIME=1 LIBVA_DRIVER_NAME=i965' to use iGPU for browsers.
- Added steam-native launch options to minimize resource usage (-silent starts steam minimized).
- Added 'mpv' to always on-top clients.
- Changed 'LCTRL + LALT + M' to 'LCRTL + SUPER + M'.
- Brave browser always starts on second monitor.
- Psensor always starts on second monitor and not always on-top anymore.
- Floating clients are always on-top except for specific clients (Psensor).

### Misc

- Removed schedtoold.conf.

# August 09, 2023

- Added CHANGELOG.md
- Added additional details to README.md
- Added _pcmanfm-qt -d_ to autorun
  - This made a noticable difference in speed when opening
- Changed wlogout to wleave as my logout screen
- Changed browser autorun to _cachy-browser_ from _firefox_
- Removed _vibrantLinux_ from autorun

### Polybar changes

- Added filesystem free space (/) to left modules between tray and workspaces with  icon
- Added additional font (Symbols Nerd Font)
- Added kernel version to right modules before volume
