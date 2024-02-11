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
