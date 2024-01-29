#!/bin/bash
rmap() {
    /usr/bin/riverctl map normal "$@"
}

rmap Super Return spawn 'wezterm';
rmap Super P spawn 'fuzzel'
rmap Super Q close;
rmap Super+Shift E exit;
rmap Super J focus-view next;
rmap Super K focus-view previous;
rmap Super+Shift J swap next;
rmap Super+Shift K swap previous;
rmap Super+Shift Return zoom;

# rmap Super H send-layout-cmd rivertile "main-ratio -0.05";
# rmap Super L send-layout-cmd rivertile "main-ratio +0.05";
# rmap Super+Shift H send-layout-cmd rivertile "main-count +1";
# rmap Super+Shift L send-layout-cmd rivertile "main-count -1";

rmap Super H send-layout-cmd rivercarro "main-ratio -0.05";
rmap Super L send-layout-cmd rivercarro "main-ratio +0.05";
rmap Super+Shift H send-layout-cmd rivercarro "main-count +1";
rmap Super+Shift L send-layout-cmd rivercarro "main-count -1";

rmap Super+Alt H move left 100;
rmap Super+Alt J move down 100;
rmap Super+Alt K move up 100;
rmap Super+Alt L move right 100;

# Super+Alt+Control+{H,J,K,L} to snap views to screen edges
rmap Super+Alt+Control H snap left;
rmap Super+Alt+Control J snap down;
rmap Super+Alt+Control K snap up;
rmap Super+Alt+Control L snap right;

# Super+Alt+Shift+{H,J,K,L} to resize views
rmap Super+Alt+Shift H resize horizontal -100;
rmap Super+Alt+Shift J resize vertical 100;
rmap Super+Alt+Shift K resize vertical -100;
rmap Super+Alt+Shift L resize horizontal 100;

# Screenshot utility
rmap Super+Shift Z spawn waylock
rmap Super U spawn 'grim -g "$(slop -f "%x,%y %wx%h")" - | wl-copy'

riverctl map-pointer normal Super BTN_LEFT move-view;
riverctl map-pointer normal Super BTN_RIGHT resize-view;
riverctl map-pointer normal Super BTN_MIDDLE toggle-float;

for i in $(seq 1 9)
do
    tags=$((1 << ($i - 1)))

    # Super+[1-9] to focus tag [0-8]
    rmap Super $i set-focused-tags $tags

    # Super+Shift+[1-9] to tag focused view with tag [0-8]
    rmap Super+Shift $i set-view-tags $tags

    # Super+Ctrl+[1-9] to toggle focus of tag [0-8]
    rmap Super+Control $i toggle-focused-tags $tags

    # Super+Shift+Ctrl+[1-9] to toggle tag [0-8] of focused view
    rmap Super+Shift+Control $i toggle-view-tags $tags
done

# Super+0 to focus all tags
# Super+Shift+0 to tag focused view with all tags
all_tags=$(((1 << 32) - 1))
rmap Super 0 set-focused-tags $all_tags
rmap Super+Shift 0 set-view-tags $all_tags

# Super+Space to toggle float
rmap Super Space toggle-float

# Super+F to toggle fullscreen
rmap Super F toggle-fullscreen

# Super+{Up,Right,Down,Left} to change layout orientation
rmap Super Up    send-layout-cmd rivercarro "main-location top"
rmap Super Right send-layout-cmd rivercarro "main-location right"
rmap Super Down  send-layout-cmd rivercarro "main-location bottom"
rmap Super Left  send-layout-cmd rivercarro "main-location left"
rmap Super M     send-layout-cmd rivercarro "main-location monocle"

rmap None XF86AudioRaiseVolume  spawn 'pamixer -i 5'
rmap None XF86AudioLowerVolume  spawn 'pamixer -d 5'
rmap None XF86AudioMute         spawn 'pamixer --toggle-mute'

riverctl border-color-focused 0x555555
riverctl border-color-unfocused 0x363636
riverctl border-width 1

# Keyboard repeat rate
riverctl set-repeat 50 300

# Make Ctrl+Space toggle between QUERTY and QWERTZ
riverctl keyboard-layout -options grp:alt_space_toggle us,de

