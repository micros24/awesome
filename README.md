# I am currently using Hyprland. My AwesomeWM configs may not be updated and may not work.

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

Reboot...

# Mandatory packages

```
yay -S xdg-user-dirs xdg-desktop-portal xdg-desktop-portal-gtk polkit-gnome \
    pavucontrol network-manager-applet bluez bluez-utils blueman sddm-git \
    gnome-keyring pcmanfm-qt alacritty flatpak file-roller lximage-qt htop \
    cpupower gopreload-git mpv pacman-contrib reflector ufw mesa timeshift \
    xf86-video-amdgpu intel-media-driver libva-mesa-driver mesa-vdpau gvfs \
    vulkan-radeon vulkan-intel seahorse ananicy-cpp irqbalance r8168-dkms \
    pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber fastfetch \
    cachyos-ananicy-rules-git
```

# Installing my AwesomeWM configs

Picom is my compositor. Polybar is my status bar. Wlogout is my logout screen. Rofi is my application runner. xfce4-clipman is my clipboard manager. Scrot is my screenshot tool. xlockmore is my lockscreen. Nitrogen is what I use to set my wallpaper.

```
yay -S awesome-git picom-git polybar-git wlogout-git xfce4-clipman-plugin \
    rofi xlockmore-nomotif playerctl scrot pamixer nitrogen lxappearance-gtk3
```

# Installing my Hyprland configs

Waybar is my status bar. Wleave is my logout screen. Rofi is my application runner. wl-clipboard is my clipboard manager. Swaylock is my lockscreen. Grim is my screenshot tool.

```
yay -S xdg-desktop-portal-hyprland hyprland-git waybar-hyprland-git mako-git \
    grim-git hyprpaper-git wl-clipboard-git wl-clip-persist-git nwg-look-bin \
    swaylock-effects-git wleave-git rofi-lbonn-wayland-git swayidle-git
```

## Installing hyprload

dependencies: cpio, ninja

```
curl -sSL https://raw.githubusercontent.com/Duckonaut/hyprload/main/install.sh | bash
```

Press SUPER + SHIFT + U to update your hyprland plugin loader

# Optional packages

```
yay -S corectrl xiccd colord easyeffects psensor
```

# My personal installs

```
yay -S kvantum firefox qt5ct util-linux zsh input-remapper-git bitwarden \
    bleachbit github-cli gimp linux-xanmod-bore linux-xanmod-bore-headers \
    linux-lts calf meld kate zsh-theme-powerlevel10k-git obs-studio-tytan652 \
    lsp-plugins font-manager breeze breeze-gtk pkgstats zsh-completions \
    ffmpegthumbnailer libinput freetype2 dbus-broker-git \

flatpak install flathub com.spotify.Client
flatpak install flathub com.brave.Browser
flatpak install flathub com.github.tchx84.Flatseal
```

## Setting up games

Install mudfish from their website (https://mudfish.net/download)

```
yay -S proton-cachyos steam-native-runtime lutris vkbasalt lib32-vkbasalt \
    mangohud wine wine-gecko vulkan-icd-loader lib32-vulkan-icd-loader \
    wine-mono winetricks-git wmctrl obs-vkcapture

flatpak install flathub net.davidotek.pupgui2
```

# Themeing

## Fonts

```
yay -S ttf-monaco ttf-roboto ttf-ubuntu-font-family ttf-dejavu ttf-hack \
    ttf-meslo-nerd-font-powerlevel10k ttf-font-awesome ttf-ebgaramond \
    gnu-free-fonts noto-fonts noto-fonts-emoji ttf-pacifico ttf-ancient-fonts \
    ttf-ubuntu-arabic ttf-freebanglafont ttf-ubraille noto-fonts-cjk ttf-mplus-git \
    ttf-kopubworld ttf-hannom ttf-paratype ttf-google-fonts-git persian-fonts \
    fonts-tlwg ttf-cm-unicode ttf-liberation ttf-liberation-mono-nerd \
    ttf-nerd-fonts-symbols
```

### Installing MiBroSoft fonts

Follow instructions from https://wiki.archlinux.org/title/Microsoft_fonts before installing the package below

```
ttf-ms-win11
```

Set the font of your terminal of choice to MesloLGS NF

## Theme installation

- https://github.com/yeyushengfan258/Reversal-icon-theme
- https://github.com/vinceliuice/Layan-gtk-theme
- Setup your themes and icons using qt5ct, kvantum, and lxappearance/nwg-look.
- Setup your SDDM theme.
- Setup your wallpaper using nitrogen if using AwesomeWM. Use hyprpaper if using Hyprland.
- Setup global font to EB Garamond:size:14.

## Setup zsh

```
chsh -s /usr/bin/zsh
```

Logout and log back in then check your default shell with `echo $SHELL`, then...

```
p10k configure
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

## Enabling services and timers

```
systemctl --user enable pipewire-pulse.service
sudo systemctl enable sddm.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable bluetooth.service
sudo systemctl enable colord.service
sudo systemctl enable cpupower.service
sudo systemctl enable input-remapper.service
sudo systemctl enable gopreload.service
sudo systemctl enable udisks2.service
sudo systemctl enable ufw.service
sudo systemctl enable dbus-broker.service
sudo systemctl enable irqbalance.service
sudo systemctl enable ananicy-cpp.service
sudo systemctl enable reflector.timer
sudo systemctl enable paccache.timer
sudo systemctl enable fstrim.timer
```

## Configuring ufw

```
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw enable
```

## Configuring your ICC profiles

https://wiki.archlinux.org/title/ICC_profiles#xiccd

```
xiccd
colormgr get-devices
colormgr get-profiles
colormgr device-add-profile device_id profile_id
colormgr device-make-profile-default device_id profile_id
cat /etc/xdg/autostart/xiccd.desktop
```

## Set-up CoreCtrl

https://gitlab.com/corectrl/corectrl/-/wikis/Setup

## Setup preload

```
gopreload-prepare program
```
