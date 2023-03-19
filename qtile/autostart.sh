#!/usr/bin/env bash
export SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

if [ -f "/tmp/leftwm-theme-down" ]; then
    /tmp/leftwm-theme-down
    rm /tmp/leftwm-theme-down
fi
ln -s $SCRIPTPATH/down /tmp/leftwm-theme-down

xbindkeys -f ~/.config/leftwm/themes/gruvbox/.xbindkeysrc &
picom  &
~/.screenlayout/main.sh &
udiskie &
nm-applet &
volumeicon &
easyeffects &
xclip &
~/.config/leftwm/themes/gruvbox/launch_polybar.sh &

leftwm-command "LoadTheme $SCRIPTPATH/theme.ron"
nitrogen --restore &  
