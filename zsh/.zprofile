#!/bin/zsh
umask 077
TTY=$(tty)
if [[ "$TTY" == "/dev/tty1" ]]; then
    export _JAVA_AWT_WM_NONREPARENTING=1
    export MOZ_ENABLE_WAYLAND=1
    exec ssh-agent dbus-run-session -- river >/tmp/river.log 2>&1
fi    
