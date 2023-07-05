# I'm currently not using Hyprland. It may or may not work.

# Installing CachyOS repositories

```
sudo pacman-key --recv-keys F3B607488DB35A47 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key F3B607488DB35A47
sudo pacman -U 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-keyring-2-1-any.pkg.tar.zst' 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-mirrorlist-17-1-any.pkg.tar.zst' 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-v3-mirrorlist-17-1-any.pkg.tar.zst' 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-v4-mirrorlist-5-1-any.pkg.tar.zst' 'https://mirror.cachyos.org/repo/x86_64/cachyos/pacman-6.0.2-10-x86_64.pkg.tar.zst'
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

# Installing my awesome configs

## Mandatory packages

Picom is my compositor. Polybar is my status bar. wlogout is my logout screen. rofi is my application runner. xfce4-clipman is my clipboard manager.

```
yay -S xdg-user-dirs xdg-desktop-portal awesome picom-jonaburg-git polybar-git wlogout-git rofi polkit-gnome xfce4-clipman bluez bluez-utils blueman network-manager-applet xlockmore-nomotif playerctl pavucontrol scrot pcmanfm-qt alacritty sddm-git gnome-keyring pamixer
```

## Optional packages

Please change rc.lua inside the awesome folder to cater if you installed any of the optional packages.

```
yay -S corectrl xiccd colord easyeffects psensor
```

# My personal installs

```
yay -S xdg-user-dirs r8168-dkms udisks2 awesome picom-jonaburg-git polybar-git \
	wlogout-git rofi polkit-gnome corectrl xiccd colord xfce4-clipman bluez \
	bluez-utils blueman psensor easyeffects network-manager-applet kvantum \
	firefox flatpak zsh input-remapper-git xlockmore-nomotif playerctl \
	file-roller bitwarden bleachbit cpupower fastfetch github-cli gopreload-git \
	lximage-qt htop linux-xanmod-bore linux-lts mpv obs-vkcapture pacman-contrib \
	pavucontrol pinta proton-cachyos protonup-qt qt5ct r8168-dkms reflector \
	timeshift ttf-font-awesome ttf-monaco ttf-roboto ttf-ubuntu-font-family \
	xf86-video-amdgpu sddm-git xorg-server util-linux ufw ttf-liberation \
	ttf-dejavu ttf-hack ttf-meslo-nerd-font-powerlevel10k intel-media-driver \
	mesa libva-mesa-driver mesa-vdpau zsh-theme-powerlevel10k-git xorg-server \
	xorg-apps gvfs vulkan-radeon vulkan-intel xdg-desktop-portal pipewire \
	pipewire-alsa pipewire-pulse pipewire-jack wireplumber brave-bin \
	obs-studio-tytan652 lsp-plugins gedit pcmanfm-qt breeze breeze-gtk \
	lxappearance-gtk3 nitrogen font-manager scrot meld pkgstats seahorse \
	alacritty zsh-completions reversal-icon-theme-git ffmpegthumbnailer \
	font-manager libinput notification-daemon pamixer

flatpak install flathub com.spotify.Client
flatpak install flathub com.github.tchx84.Flatseal
```

## Setting up games

Install mudfish from their website (https://mudfish.net/download).

```
yay -S proton-cachyos steam-native-runtime lutris vkbasalt-git gamemode lib32-gamemode mangohud schedtool schedtoold wine wine-gecko wine-mono winetricks-git wmctrl
```

# Themeing

- Setup your themes and icons using qt5ct, kvantum, and lxappearance.

- Setup your SDDM theme.

- Setup your wallpaper using nitrogen.

## Setup zsh

```
sudo chsh -s /usr/bin/zsh
```

Logout and log back in then check your default shell with `echo $SHELL`, then...

```
p10k configure
```

## Setup flatpak themes

```
com.github.tchx84.Flatseal.desktop
```

Filesystem:

> xdg-config/Kvantum:ro
> ~/.themes
> ~/.icons

Environment:

> QT_STYLE_OVERRIDE=kvantum
> GTK_THEME=Layan-Dark

# Essential configurations

## Setup notification-daemon

/usr/share/dbus-1/services/org.freedesktop.Notifications.service

```
[D-BUS Service]
Name=org.freedesktop.Notifications
Exec=/usr/lib/notification-daemon-1.0/notification-daemon
```

## Installing MiBroSoft fonts

Follow instructions from https://wiki.archlinux.org/title/Microsoft_fonts before installing the package below

```
ttf-ms-win11
```

Set the font of your terminal of choice to MesloLGS NF

## Enabling services and timers

```
sudo systemctl enable sddm.service
sudo systemctl enable networkmanager.service
sudo systemctl enable bluetooth.service
sudo systemctl enable colord.service
sudo systemctl enable cpupower.service
sudo systemctl enable input-remapper.service
sudo systemctl enable udisks2.service
sudo systemctl enable gopreload.service
sudo systemctl enable schedtoold.service
sudo systemctl enable ufw.service
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
