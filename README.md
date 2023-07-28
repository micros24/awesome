# I'm currently not using Hyprland. It may or may not work.

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

# Installing my awesome configs

## Mandatory packages

Picom is my compositor. Polybar is my status bar. wlogout is my logout screen. rofi is my application runner. xfce4-clipman is my clipboard manager.

```
yay -S xdg-user-dirs xdg-desktop-portal awesome-git picom-git polybar-git \
    wlogout-git rofi polkit-gnome xfce4-clipman-plugin bluez bluez-utils blueman \
    network-manager-applet xlockmore-nomotif playerctl pavucontrol scrot \
    pcmanfm-qt alacritty sddm-git gnome-keyring pamixer
```

## Optional packages

Please change autorun.sh inside the awesome folder to cater if you installed any of the optional packages.

```
yay -S corectrl xiccd colord easyeffects psensor
```

# My personal installs

```
yay -S r8168-dkms awesome-git picom-git polybar-git wlogout-git rofi \
    polkit-gnome corectrl xiccd colord xfce4-clipman-plugin bluez bluez-utils \
    blueman psensor easyeffects network-manager-applet kvantum firefox pamixer \
    flatpak zsh input-remapper-git xlockmore-nomotif playerctl file-roller \
    bitwarden bleachbit cpupower fastfetch github-cli gopreload-git lximage-qt \
    htop linux-xanmod-bore linux-xanmod-bore-headers linux-lts mpv \
    pacman-contrib pavucontrol gimp qt5c reflector timeshift xf86-video-amdgpu \
    sddm-git util-linux ufw intel-media-driver mesa libva-mesa-driver mesa-vdpau \
    zsh-theme-powerlevel10k-git gvfs vulkan-radeon vulkan-intel calf \
    xdg-desktop-portal pipewire pipewire-alsa pipewire-pulse pipewire-jack \
    wireplumber brave-bin obs-studio-tytan652 lsp-plugins kate pcmanfm-qt \
    breeze breeze-gtk lxappearance-gtk3 nitrogen font-manager scrot meld \
    pkgstats seahorse alacritty zsh-completions ffmpegthumbnailer libinput \
    freetype2 rng-tools dbus-broker irqbalance uksmd-git \

flatpak install flathub com.spotify.Client
flatpak install flathub com.github.tchx84.Flatseal
```

## Setting up games

Install mudfish from their website (https://mudfish.net/download)

```
yay -S proton-cachyos steam-native-runtime lutris vkbasalt lib32-vkbasalt \
    mangohud wine wine-gecko vulkan-icd-loader lib32-vulkan-icd-loader \
    wine-mono winetricks-git wmctrl obs-vkcapture
```

# Themeing

## Fonts

```
yay -S ttf-monaco ttf-roboto ttf-ubuntu-font-family ttf-dejavu ttf-hack \
    ttf-meslo-nerd-font-powerlevel10k ttf-font-awesome ttf-ebgaramond \
    gnu-free-fonts noto-fonts noto-fonts-emoji ttf-pacifico ttf-ancient-fonts \
    ttf-ubuntu-arabic ttf-freebanglafont ttf-ubraille noto-fonts-cjk ttf-mplus-git \
    ttf-kopubworld ttf-hannom ttf-paratype ttf-google-fonts-git persian-fonts \
    fonts-tlwg ttf-cm-unicode ttf-liberation

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
- Setup your themes and icons using qt5ct, kvantum, and lxappearance.
- Setup your SDDM theme.
- Setup your wallpaper using nitrogen.
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
sudo systemctl enable uksmd
sudo systemctl enable sddm.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable bluetooth.service
sudo systemctl enable colord.service
sudo systemctl enable cpupower.service
sudo systemctl enable input-remapper.service
sudo systemctl enable gopreload.service
sudo systemctl enable schedtoold.service
sudo systemctl enable udisks2.service
sudo systemctl enable ufw.service
sudo systemctl enable dbus-broker.service
sudo systemctl enable rngd.service
sudo systemctl enable irqbalance.service
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
