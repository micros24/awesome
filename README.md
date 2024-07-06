# This branch is dedicated to AwesomeWM using X11. If you're looking for my Hyprland dotFiles, switch to master branch.

# Installing yay (Yet Another Yogurt) AUR helper

```
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

## Configuring yay

```
yay -Y --gendb
yay -Y --devel --save
yay --editmenu --nodiffmenu --save
```

# Installing CachyOS' x86_64_v3 repositories

```
sudo pacman-key --recv-keys F3B607488DB35A47 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key F3B607488DB35A47
sudo pacman -U 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-keyring-3-1-any.pkg.tar.zst' 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-mirrorlist-18-1-any.pkg.tar.zst' 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-v3-mirrorlist-18-1-any.pkg.tar.zst' 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-v4-mirrorlist-6-1-any.pkg.tar.zst' 'https://mirror.cachyos.org/repo/x86_64/cachyos/pacman-6.0.2-16-x86_64.pkg.tar.zst'
```

```
sudo nano /etc/pacman.conf
```

```
[cachyos-v3]
Include = /etc/pacman.d/cachyos-v3-mirrorlist
[cachyos-core-v3]
Include = /etc/pacman.d/cachyos-v3-mirrorlist
[cachyos-extra-v3]
Include = /etc/pacman.d/cachyos-v3-mirrorlist
[cachyos]
Include = /etc/pacman.d/cachyos-mirrorlist
```

```
sudo pacman -Syyuu
```

# Mandatory packages

```
yay -S xdg-user-dirs xdg-desktop-portal-gtk polkit-gnome pcmanfm-qt-git \
    pavucontrol network-manager-applet bluez bluez-utils blueman sddm-git \
    alacritty flatpak file-roller lximage-qt-git htop xorg-xhost \
    cpupower gopreload-git mpv pacman-contrib reflector ufw mesa timeshift \
    intel-media-driver libva-mesa-driver lib32-libva-mesa-driver gvfs \
    mesa-vdpau lib32-mesa-vdpau vulkan-radeon lib32-vulkan-radeon \
    vulkan-intel lib32-vulkan-intel ananicy-cpp-git irqbalance r8168-dkms \
    pipewire lib32-pipewire pipewire-alsa pipewire-pulse pipewire-jack \
    wireplumber fastfetch cachyos-ananicy-rules-git cachy-browser \
    libdbusmenu-qt5 gnome-keyring droidcam
```

# Installing my AwesomeWM configs

Picom is my compositor. Polybar is my status bar. Wleave is my logout screen. Rofi is my application runner. xfce4-clipman is my clipboard manager. Scrot is my screenshot tool. xlockmore is my lockscreen. Nitrogen is what I use to set my wallpaper.

```
yay -S awesome-git picom-git polybar-git wleave-git xfce4-clipman-plugin \
    rofi-lbonn-wayland-git playerctl pamixer nitrogen xlockmore-blank \
    xf86-video-amdgpu lxappearance-gtk3 scrot
```

# My personal installs

```
yay -S kvantum firefox qt6ct util-linux bitwarden bleachbit  \
    github-cli gimp linux-xanmod-bore linux-xanmod-bore-headers zsh \
    calf meld linux-lts lsp-plugins breeze-snow-cursor-theme \
    pkgstats kdenlive ffmpegthumbnailer libinput dbus-broker \
    easyeffects psensor corectrl libreoffice-still rocm-opencl-runtime \
    intel-compute-runtime perl-image-exiftool kate xautolock caffeine-git \
    xf86-input-evdev
```

## Flatpaks

```
flatpak install flathub com.spotify.Client
flatpak install flathub com.github.tchx84.Flatseal
```

# Setting up gaming

Install [Mudfish VPN](https://mudfish.net/download) from their website.
Install packages from [cachyos-gaming-meta](https://github.com/CachyOS/CachyOS-PKGBUILDS/blob/master/cachyos-gaming-meta/PKGBUILD).

```
yay -S --needed vkbasalt lib32-vkbasalt wmctrl protonup-qt proton-cachyos \
    steam-screensaver-fix
```

## Open Broadcasting Software (OBS) Studio

```
yay -S obs-studio-tytan652 obs-vkcapture lib32-obs-vkcapture \
    obs-pipewire-audio-capture libmfx onevpl-intel-gpu
```

# Themeing

## Fonts

```
yay -S ttf-hack ttf-meslo-nerd-font-powerlevel10k ttf-font-awesome \
    ttf-ebgaramond gnu-free-fonts noto-fonts noto-fonts-emoji \
    adobe-source-han-sans-cn-fonts adobe-source-han-sans-jp-fonts \
    adobe-source-han-sans-kr-fonts freetype2 ttf-dejavu ttf-liberation \
    awesome-terminal-fonts opendesktop-fonts ttf-bitstream-vera \
    ttf-opensans ttf-meslo-nerd noto-fonts-cjk noto-fonts-cjk \
    noto-color-emoji-fontconfig cantarell-fonts
```

### Installing MiBroSoft fonts

Follow instructions from https://wiki.archlinux.org/title/Microsoft_fonts before installing the package below

```
ttf-ms-win11
```

Set the font of your terminal of choice to MesloLGS NF

## Theme installation

- [Reversal icon theme](https://github.com/yeyushengfan258/Reversal-icon-theme)
- [Layan-GTK-theme](https://github.com/vinceliuice/Layan-gtk-theme)
- [Layan-KDE](https://github.com/vinceliuice/Layan-kde) for Kvantum.
- Setup your themes and icons using qt5ct, kvantum, and nwg-look.
- Setup your [SDDM theme](https://github.com/Rokin05/sddm-themes/tree/master/src/sober).
- Setup your wallpaper using nitrogen.
- Setup global font to EB Garamond:size:14.

## Setup zsh

Install recommended fonts at https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k

```
p10k configure
```

## Setup flatpak themes

```
flatpak run com.github.tchx84.Flatseal
```

Filesystem:

`xdg-config/Kvantum:ro`

`~/.themes`

`~/.icons`

Environment:

`ICON_THEME=Reversal-purple-dark`

`QT_STYLE_OVERRIDE=kvantum`

`GTK_THEME=Layan-Dark`

# Essential configurations

## Performance Optimizations

- Install `cachyos-settings`
- [profile-sync-daemon](https://wiki.archlinux.org/title/Profile-sync-daemon) puts your browser's profile into memory so it would decrease I/O operations in your disks.
- [Arch Linux Optimization Guide](https://ventureo.codeberg.page/) Translate to english if you can't read Russian.
- CachyOs [Post-install steps](https://wiki.cachyos.org/configuration/post_install_setup/)
- CachyOs [General System Tweaks](https://wiki.cachyos.org/configuration/general_system_tweaks/)
- ArchWiki [Gaming](https://wiki.archlinux.org/title/Gaming#Improving_performance)

## Configuring ufw

```
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw enable
```

## Enabling services and timers

```
psd
systemctl --user enable pipewire-pulse.service
systemctl --user enable psd
sudo systemctl enable sddm.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable bluetooth.service
sudo systemctl enable cpupower.service
sudo systemctl enable gopreload.service
sudo systemctl enable udisks2.service
sudo systemctl enable ufw.service
sudo systemctl enable irqbalance.service
sudo systemctl enable ananicy-cpp.service
sudo systemctl enable reflector.service
sudo systemctl enable paccache.timer
sudo systemctl enable fstrim.timer
```

## Configuring your ICC profiles

```
cp icc_profile /usr/share/color/icc/colord/
xiccd
colormgr get-devices
colormgr get-profiles
colormgr device-add-profile device_id profile_id
colormgr device-make-profile-default device_id profile_id
cat /etc/xdg/autostart/xiccd.desktop
```

## Set-up monitor EDID

```
sudo mkdir /usr/lib/firmware/edid/
cp edid-HDMI.bin /usr/lib/firmware/edid/
```

## Set-up CoreCtrl

https://gitlab.com/corectrl/corectrl/-/wikis/Setup

## Setup preload

https://wiki.archlinux.org/title/Preload

```
gopreload-prepare alacritty
```

```
gopreload-prepare pcmanfm-qt
```

```
gopreload-prepare lximage-qt
```
