# A note on Hyprland...

Hyprland has implemented tearing. However, the tearing implementation makes it so that you use a software cursor. This means that when your game is lagging, the cursor on your screen will only update equal to your fps. It is not independent of your mouse movement. For example, when your game is lagging at 2 fps, the cursor on your screen will only move twice every second. Its placement is determined on how you moved your mouse physically. Another example: If your game is lagging at 0 fps (loading screen, long lag spikes), your cursor on screen will not move, even if you moved your mouse physically. This may not be a significant impact on your gaming preferences, but I like my cursor where I move my mouse and when I move my mouse.

### January 31, 2024

Performance on my PC has been better since the last time I used Hyprland. However, the note above still applies and I still notice the occasional lag and therefore, cursor lag. It has come to a point that lag doesn't happen frequently, compared to before, so the cursor lag does not happen as frequently. I'm back to using Hyprland as my main Window Manager.

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

# Installing x86_64_v3 repositories

You have two repository choices: CachyOS or ALHP.

## CachyOS

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
```

```
sudo pacman -Syyuu
```

## ALHP

```
yay -S alhp-keyring alhp-mirrorlist
```

```
sudo nano /etc/pacman.conf
```

```
[core-x86-64-v3]
Include = /etc/pacman.d/alhp-mirrorlist

[extra-x86-64-v3]
Include = /etc/pacman.d/alhp-mirrorlist

[multilib-x86-64-v3]
Include = /etc/pacman.d/alhp-mirrorlist
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
    qt5-wayland libdbusmenu-qt5 gnome-keyring droidcam
```

# Installing my AwesomeWM configs

Picom is my compositor. Polybar is my status bar. Wleave is my logout screen. Rofi is my application runner. xfce4-clipman is my clipboard manager. Scrot is my screenshot tool. xlockmore is my lockscreen. Nitrogen is what I use to set my wallpaper.

```
yay -S awesome-git picom-git polybar-git wleave-git xfce4-clipman-plugin \
    rofi-lbonn-wayland-git xlockmore-nomotif playerctl pamixer nitrogen \
    xf86-video-amdgpu lxappearance-gtk3 scrot
```

# Installing my Hyprland configs

Waybar is my status bar. Wleave is my logout screen. Wofi is my application runner. wl-clipboard is my clipboard manager. Swaylock is my lockscreen. Grim is my screenshot tool. Mako is my notifications manager.

```
yay -S xdg-desktop-portal-hyprland-git hyprland-git waybar-git mako \
    grim-git hyprpaper-git wl-clip-persist cliphist nwg-look-bin \
    swaylock-effects-git wleave-git wofi swayidle-git swappy grimblast-git \
    pamixer
```

## Installing hyprload

dependencies: cpio, ninja

```
curl -sSL https://raw.githubusercontent.com/Duckonaut/hyprload/main/install.sh | bash
```

Press SUPER + SHIFT + U to update your hyprland plugin loader

# My personal installs

```
yay -S kvantum firefox qt5ct util-linux bitwarden bleachbit geany fish \
    github-cli gimp linux-xanmod-bore linux-xanmod-bore-headers calf meld \
    linux-lts obs-studio-tytan652 lsp-plugins breeze-snow-cursor pkgstats \
    ffmpegthumbnailer libinput dbus-broker easyeffects psensor corectrl \
    kdenlive obs-vkcapture lib32-obs-vkcapture obs-pipewire-audio-capture \
    brave-bin libreoffice-still rocm-opencl-runtime intel-compute-runtime \
    weston-git

flatpak install flathub com.spotify.Client
flatpak install flathub com.github.tchx84.Flatseal
```

# Setting up gaming

Install [Mudfish VPN](https://mudfish.net/download) from their website.
Install packages from [cachyos-gaming-meta](https://github.com/CachyOS/CachyOS-PKGBUILDS/blob/master/cachyos-gaming-meta/PKGBUILD).

```
yay -S --needed vkbasalt lib32-vkbasalt wmctrl protonup-qt proton-cachyos
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
- Setup your SDDM theme.
- Setup your wallpaper using nitrogen if using AwesomeWM. Use hyprpaper if using Hyprland.
- Setup global font to EB Garamond:size:14.

## Setup fish

- Add [tide](https://github.com/IlanCosman/tide) if you're using fish.

```
yay -S cachyos-fish-config
chsh -s /usr/bin/fish
```

Logout and log back in then check your default shell with `echo $SHELL`, then install tide...

```
fisher install IlanCosman/tide@v6
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

- [profile-sync-daemon](https://wiki.archlinux.org/title/Profile-sync-daemon) puts your browser's profile into memory so it would decrease I/O operations in your disks.
- [zram-generator](https://wiki.archlinux.org/title/Zram)
- [Arch Linux Optimization Guide](https://ventureo.codeberg.page/) Translate to english if you can't read Russian.
- Install `cachyos-settings`
- CachyOs [Post-install steps](https://wiki.cachyos.org/first_steps/first-steps/)
- CachyOs [General System Tweaks](https://wiki.cachyos.org/general_info/general_system_tweaks/)
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

### dispwin for Wayland

```
sudo pacman -S argyllcms
dispwin -d 1 '..../Documents/Monitor Drivers/KA242Y.icm' &
```

### xiccd for X11

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

```
gopreload-prepare geany
```

```
gopreload-prepare alacritty
```

```
gopreload-prepare pcmanfm-qt
```

```
gopreload-prepare lximage-qt
```

# KDE Plasma

Setting alt-tab delay to 0ms

```
kwriteconfig5 --file ~/.config/kwinrc --group TabBox --key DelayTime 0
qdbus org.kde.KWin /KWin reconfigure
```

Environment variables

```
KWIN_DRM_DEVICES=/dev/dri/card1:/dev/dri/card0 # set primary gpu
KWIN_DRM_NO_AMS=1 # allow tearing
```

Install `Dynamic Workspaces` and `Polonium` KWin Scripts.

## Setting SDDM to Wayland

/etc/sddm.conf.d/10-wayland.conf

```
[General]
DisplayServer=wayland
GreeterEnvironment=QT_WAYLAND_SHELL_INTEGRATION=layer-shell

[Wayland]
CompositorCommand=kwin_wayland --drm --no-lockscreen --no-global-shortcuts --locale1
```
