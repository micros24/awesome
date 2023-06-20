# Installing CachyOS repositories

```
sudo pacman-key --recv-keys F3B607488DB35A47 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key F3B607488DB35A47
sudo pacman -U 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-keyring-2-1-any.pkg.tar.zst' 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-mirrorlist-17-1-any.pkg.tar.zst' 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-v3-mirrorlist-17-1-any.pkg.tar.zst' 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-v4-mirrorlist-5-1-any.pkg.tar.zst' 'https://mirror.cachyos.org/repo/x86_64/cachyos/pacman-6.0.2-10-x86_64.pkg.tar.zst'
sudp pacman -Syyuu
```

# Installing yay (Yet Another Yogurt) AUR helper

```
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

# Installing my awesome configs

## Mandatory packages

Picom is my compositor. Polybar is my status bar. wlogout is my logout screen. rofi is my application runner. xfce4-clipman is my clipboard manager.

```
yay -S awesome picom-jonaburg-git polybar wlogout-git rofi-lbonn-wayland polkit-kde-agent xfce4-clipman bluez bluez-utils blueman network-manager-applet pamixer dolphin xlockmore-nomotif playerctl pavucontrol
```

## Optional packages

Please change rc.lua inside the awesome folder to cater if you installed any of the optional packages.

```
yay -S corectrl xiccd colord easyeffects psensor
```

## My personal installs

```
yay -S awesome picom-jonaburg-git polybar wlogout-git rofi-lbonn-wayland polkit-kde-agent corectrl xiccd colord xfce4-clipman bluez bluez-utils blueman psensor easyeffects network-manager-applet pamixer dolphin qt5ct kvantum kate firefox flatpak zsh input-remapper-git xlockmore-nomotif playerctl nano sudo ark bitwarden bleachbit cpupower fastfetch fuse2fs github-cli gopreload-git gwenview htop kompare linux-cachyos-bore linux-cachyos-bore-headers linux-lts linux-xanmod linux-xanmod-headers lsp-plugins lutris man-db mangohud mpv obs-vkcapture pacman-contrib pavucontrol pinta proton-cachyos protonup-qt qt5ct r8168-dkms reflector timeshift ttf-font-awesome ttf-monaco ttf-roboto ttf-ubuntu-font-family wget wine-gecko wine-mono winetricks-git xf86-video-amdgpu sddm-git xorg-server util-linux ufw ttf-liberation ttf-dejavu intel-media-driver mesa libva-mesa-driver mesa-vdpau zsh-theme-powerlevel10k-git

flatpak install flathub com.spotify.Client
flatpak install flathub com.github.tchx84.Flatseal
```

# Setup zsh

Install recommended fonts at https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k

```
p10k configure
```

# Enabling services and timers

```
sudo systemctl enable networkmanager.service
sudo systemctl enable bluetooth.service
sudo systemctl enable colord.service
sudo systemctl enable cpupower.service
sudo systemctl enable input-remapper.service
sudo systemctl enable sddm.service
sudo systemctl enable udisks2.service
sudo systemctl enable ufw.service
sudo systemctl enable reflector.timer
sudo systemctl enable paccache.timer
sudo systemctl enable fstrim.timer

```

# Configuring ufw

```
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw enable
```
