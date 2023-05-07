#!/bin/zsh
TTY=$(tty)
if [[ "$TTY" == "/dev/tty1" ]]; then
    exec startx
fi    
