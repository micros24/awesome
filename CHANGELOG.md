# June 6, 2024

- Added `hyprcursor-git hyprlang-git hyprwayland-scanner-git`

# April 21, 2024

- Added `gamemode lib32-gamemode` to "Setting Up Gaming" section.
- Added `hyprlock-git hypridle-git` to the Hyprland section.
- Removed `swaylock-effects-git'.
- Updated dotFiles to latest.

# March 3, 2024

- Added `bluez-obex gvfs-mtp`.

# February 15, 2024

- Moved changelogs to its own folder by year.
- Updated `gamemode.ini` and `MangoHud.conf` to latest.

# February 12, 2024

- Removed fish for zsh.
- Added `wlroots-git modprobed-db-git cachyos-zsh-config` packages.
- Added `systemctl --user enable modprobed-db` service.
- Moved fish its own branch.
- Moved KDE to its own branch.

# February 10, 2024

- Added nanorc.
- Added description to commands when adding x86_64_v3 repositories.
- Renamed aliases to shell.
- Updated hyprland dotfile to latest.
- Moved X11-related stuff to its own branch.

# February 6, 2024

- Tweaked formatting.
- Tweaked aliases.
- Updated CachyOS repository.
- Added `perl-image-exiftool` to "My Personal Installs".
- Added new section "Open Broadcasting Software (OBS) Studio".
  - Moved OBS and its plugins to this section from "My Personal Installs".

# February 5, 2024

- Tweaked formatting.
- Updated CachyOS repository.
- Updated dotFiles.
- Updated Hyprland dotFiles.
- Added `proton-cachyos` to Gaming section.
- Changed `gopreload-prepare kate` to `gopreload-prepare geany`
- Mandatory packages section...
  - Added `pcmanfm-qt-git lximage-qt-git xorg-xhost qt5-wayland qt5-wayland libdbusmenu-qt5 gnome-keyring droidcam`
  - Removed `xdg-desktop-portal pcmanfm-qt lximage-qt`
- Hyprland configs section...
  - Added `cliphist`
  - Removed `wl-clipboard`
- My Personal installs section...
  - Added `geany breeze-snow-cursor weston-git`
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
