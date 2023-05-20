#!/bin/sh
export PATH="$PATH:/usr/local/bin"

export _JAVA_AWT_WM_NONREPARENTING=1

export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export ZDOTDIR="$HOME/.config/zsh"

export QT_QPA_PLATFORMTHEME=qt5ct
# Disable client-side GTK decorations
# export GTK_CSD=0
# export LD_PRELOAD=/usr/lib/libgtk3-nocsd.so.0

# Make permissions for new files more strict
umask 066

setxkbmap us

xrandr --output HDMI-1 --primary --auto --output VGA-1 --right-of HDMI-1 --auto --output LVDS-1 --off

feh --no-fehbg --bg-fill "$HOME/Media/Pictures/Jammy-Jellyfish_WP_1920x1080.png"

# Window effects like blur
# picom &

# Notifications
# dunst &

export "$(gnome-keyring-daemon --start)"

# screenkey &

/usr/bin/pipewire &

exec dwm
