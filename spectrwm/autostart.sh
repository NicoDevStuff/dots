#!/bin/sh

is_running() {
    pgrep "$1" > /dev/null 2>&1
}

is_running sxhkd || sxhkd &
is_running ~/.screenlayout/main.sh || ~/.screenlayout/main.sh &
is_running nitrogen || nitrogen --restore &
is_running nm-applet || nm-applet &
is_running volumeicon || volumeicon &
# is_running cbatticon || cbatticon &
is_running udiskie || udiskie &
is_running xclip || xclip &
is_running easyeffects || easyeffects &
is_running solaar || solaar &
is_running polybar || ~/.config/polybar/launch_polybar.sh
