# February 5, 2024

- Tweaked formatting.
- Updated CachyOS repository.
- Added `proton-cachyos` to Gaming section.
- Changed `gopreload-prepare kate` to `gopreload-prepare geany`
- Mandatory packages section...
  - Added `pcmanfm-qt-git lximage-qt-git xorg-xhost qt5-wayland qt5-wayland libdbusmenu-qt5 gnome-keyring`
  - Removed `xdg-desktop-portal pcmanfm-qt lximage-qt`
- Hyprland configs section...
  - Added `cliphist`
  - Removed `wl-clipboard`
- My Personal installs section...
  - Added `geany breeze-snow-cursor`
  - Removed `kate breeze breeze-gtk`

# January 31, 2024

- Changed and updated note regarding Hyprland.
- Added note on x86_64_v3 section.

# January 25, 2024

- Changed 'Installing CachyOS repositories' to 'Installing x86_64_v3 repositories'...
  - Added ALHP repository.
  - Changed CachyOS section to include pacman.conf additions.
- Added mako to Hyprland applications in description (The packages is not changed, only the description).
- 'KDE Plasma' section...
  - Added '## Setting SDDM to Wayland' category.
  - Added KWin scripts.
- Changed 'Rofi' to 'Wofi' in Hyprland description.
- Fixed formatting.

# January 17, 2024

- Added a new section "KDE Plasma".

# January 14, 2024

- Streamlined links into texts.
- Changed installations...
  - Reduced font installations.
  - Added 32-bit libraries.
  - Added `cachy-browser`.
- AwesomeWm configs...
  - Moved `xf86-video-amdgpu` to AwesomeWM configs.
- Hyprland configs...
  - Added `pamixer` and `grimblast-git` to Hyprland configs.
- Personal installs...
  - Moved `easyeffects psensor corectrl` from optional packages.
  - Moved `brave-bin` from flatpak to package.
  - Added...
  ```
  dbus-broker kdenlive obs-vkcapture lib32-obs-vkcapture obs-pipewire-audio-capture \
  libreoffice-still intel-compute-runtime rocm-opencl-runtime
  ```
- Changed section heading "Setting up games" to "Setting up gaming"..
  - Added `cachyos-gaming-meta vkbasalt lib32-vkbasalt wmctrl protonup-qt`.
- Changed zsh to fish as my shell...
  - Added `cachyos-fish-config`.
  - Changed change shell command to fish.
  - Moved `tide` to this section.
- Essential configurations...
  - Fixed Arch Linux Optimization Guide link.
  - Added `cachyos-settings`.
  - Moved "Configuring ufw" to this section.
  - Removed dbus-broker from services (it is run automatically).
  - Changed "reflector.timer" to "reflector.service"
- Configuring your ICC profiles...
  - Added dispwin.
  - Added new xiccd instruction.
  - Added `mkdir` to setting up EDID.
  - Changed EDID filename accordingly.
- grub config...
  - Added `zswap.enabled=0`.
  - Re-added `split_lock_detect=off`.
  - Removed `loglevel=3 rd.udev.log_level=3 modprobe.blacklist=iTCO_wdt systemd.show_status=auto`.
  - Changed EDID filename accordingly.
- Added `pcmanfm-qt` and `lximage-qt` to gopreload.
- Added kdenlive rendering profile to configs.
- Removed Optional packages section.
- Removed zsh.

# January 12, 2024

- Theme installation
  - Added Layan-kde for Kvantum.
  - Added tide for fish users.
- Added new category Performance Optimizations
  - Added profile-sync-daemon.
  - Added zram-generator.
  - Added Arch Linux Optimization Guide.
  - Added CachyOs tweaks.
  - Added ArchWiki Gaming.
- Added swappy to hyprland.
- Added CREDITS.md.
- Updated hyprland.conf.
- Updated grub.
- Updated window-rules.conf.
- Replaced rofi-lbonn-wayland-git with wofi if using Hyrpland.
- Removed imput-remapper.service.
- Removed colord.service.

# November 8, 2023

- Added note on Hyprland in README.md.
- Added a new section: Set-up monitor EDID.
- Added evdev config as driver for mouse inputs.
- Updated grub configuration...
  - Added threadirqs.
  - Added drm.edid_firmware=HDMI-A-1:edid/edid2.bin.
  - Removed blacklisting of watchdogs.
  - Removed raid=noautodetect.
  - Removed rootfstype=ext4.
  - Removed split_lock_detect=off.
  - Removed audit=0.
- Replaced rofi with rofi-lbonn-wayland-git.
- Replaced waybar-hyprland with waybar-git.
- Removed input-remapper-git.

# October 21, 2023

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
