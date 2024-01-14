# I'm not actively using Hyprland...

Hyprland has implemented tearing. However, the tearing implementation makes it so that you use a software cursor. This means that when your game is lagging, the cursor on your screen will only update equal to your fps. It is not independent of your mouse movement. For example, when your game is lagging at 2 fps, the cursor on your screen will only move twice every second. Its placement is determined on how you moved your mouse physically. Another example: If your game is lagging at 0 fps (loading screen, long lag spikes), your cursor on screen will not move, even if you moved your mouse physically. This may not be a significant impact on your gaming preferences, but I like my cursor where I move my mouse and when I move my mouse.

# Installing CachyOS repositories

```
sudo pacman-key --recv-keys F3B607488DB35A47 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key F3B607488DB35A47
sudo pacman -U 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-keyring-2-1-any.pkg.tar.zst' 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-mirrorlist-17-1-any.pkg.tar.zst' 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-v3-mirrorlist-17-1-any.pkg.tar.zst' 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-v4-mirrorlist-5-1-any.pkg.tar.zst' 'https://mirror.cachyos.org/repo/x86_64/cachyos/pacman-6.0.2-10-x86_64.pkg.tar.zst'
```

Edit /etc/pacman.conf depending on your CPU's architecture (x86-64-v3 or x86_64-v4) (https://wiki.cachyos.org/en/home/Repo) then execute...

```
sudo pacman -Syyuu
```

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

# Mandatory packages

```
yay -S xdg-user-dirs xdg-desktop-portal xdg-desktop-portal-gtk polkit-gnome \
    pavucontrol network-manager-applet bluez bluez-utils blueman sddm-git \
    pcmanfm-qt alacritty flatpak file-roller lximage-qt htop \
    cpupower gopreload-git mpv pacman-contrib reflector ufw mesa timeshift \
    intel-media-driver libva-mesa-driver lib32-libva-mesa-driver gvfs \
    mesa-vdpau lib32-mesa-vdpau vulkan-radeon lib32-vulkan-radeon \
    vulkan-intel lib32-vulkan-intel ananicy-cpp-git irqbalance r8168-dkms \
    pipewire lib32-pipewire pipewire-alsa pipewire-pulse pipewire-jack \
    wireplumber fastfetch cachyos-ananicy-rules-git cachy-browser
```

# Installing my AwesomeWM configs

Picom is my compositor. Polybar is my status bar. Wleave is my logout screen. Rofi is my application runner. xfce4-clipman is my clipboard manager. Scrot is my screenshot tool. xlockmore is my lockscreen. Nitrogen is what I use to set my wallpaper.

```
yay -S awesome-git picom-git polybar-git wleave-git xfce4-clipman-plugin \
    rofi-lbonn-wayland-git xlockmore-nomotif playerctl scrot pamixer nitrogen \
    xf86-video-amdgpu lxappearance-gtk3
```

# Installing my Hyprland configs

Waybar is my status bar. Wleave is my logout screen. Rofi is my application runner. wl-clipboard is my clipboard manager. Swaylock is my lockscreen. Grim is my screenshot tool.

```
yay -S xdg-desktop-portal-hyprland-git hyprland-git waybar-git mako \
    grim-git hyprpaper-git wl-clipboard wl-clip-persist nwg-look-bin \
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
yay -S kvantum firefox qt5ct util-linux bitwarden bleachbit kate fish \
    github-cli gimp linux-xanmod-bore linux-xanmod-bore-headers calf meld \
    linux-lts obs-studio-tytan652 lsp-plugins breeze breeze-gtk pkgstats \
    ffmpegthumbnailer libinput dbus-broker easyeffects psensor corectrl \
    kdenlive obs-vkcapture lib32-obs-vkcapture obs-pipewire-audio-capture \
    brave-bin libreoffice-still rocm-opencl-runtime intel-compute-runtime

flatpak install flathub com.spotify.Client
flatpak install flathub com.github.tchx84.Flatseal
```

# Setting up gaming

Install [Mudfish VPN](https://mudfish.net/download) from their website.
Install packages from [cachyos-gaming-meta](https://github.com/CachyOS/CachyOS-PKGBUILDS/blob/master/cachyos-gaming-meta/PKGBUILD).

```
yay -S --needed vkbasalt lib32-vkbasalt wmctrl protonup-qt
```

# Themeing

## Fonts

```
yay -S ttf-hack ttf-meslo-nerd-font-powerlevel10k ttf-font-awesome \
    ttf-ebgaramond gnu-free-fonts noto-fonts noto-fonts-emoji noto-fonts-cjk \
    ttf-liberation adobe-source-han-sans-cn-fonts adobe-source-han-sans-jp-fonts \
    adobe-source-han-sans-kr-fonts noto-color-emoji-fontconfig freetype2 ttf-dejavu \
    awesome-terminal-fonts cantarell-fonts opendesktop-fonts ttf-bitstream-vera \
    ttf-opensans ttf-meslo-nerd noto-fonts-cjk
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

> xdg-config/Kvantum:ro

> ~/.themes

> ~/.icons

Environment:

> ICON_THEME=Reversal-purple-dark

> QT_STYLE_OVERRIDE=kvantum

> GTK_THEME=Layan-Dark

# Essential configurations

## Performance Optimizations

- [profile-sync-daemon](https://wiki.archlinux.org/title/Profile-sync-daemon) puts your browser's profile into memory so it would decrease I/O operations in your disks.
- [zram-generator](https://wiki.archlinux.org/title/Zram)
- [Arch Linux Optimization Guide](https://ventureo.codeberg.page/) Translate to english if you can't read Russian.
- Install `cachyos-settings`.
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

### dispwin

```
sudo pacman -S argyllcms
dispwin -d 1 '..../Documents/Monitor Drivers/KA242Y.icm' &
```

### xiccd

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

> gopreload-prepare _program_

> gopreload-prepare kate

> gopreload-prepare alacritty

> gopreload-prepare pcmanfm-qt

> gopreload-prepare lximage-qt
