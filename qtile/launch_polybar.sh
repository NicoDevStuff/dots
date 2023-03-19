killall polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -c ~/.config/leftwm/themes/gruvbox/config_polybar.ini &
  done
else
	polybar -c ~/.config/leftwm/themes/gruvbox/config_polybar.ini &
fi
