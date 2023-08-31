#!/bin/sh

# INC=60
INC=$(command cat ~/.config/bspwm/scripts/.inc)

case $1 in
	"incx")
		bspc node -z left -$INC 0
		bspc node -z right +$INC 0
	;;

	"decx")
		bspc node -z right -$INC 0
		bspc node -z left +$INC 0
	;;

	"incy")
		bspc node -z top 0 -$INC
		bspc node -z bottom 0 +$INC
	;;

	"decy")
		bspc node -z top 0 +$INC
		bspc node -z bottom 0 -$INC
	;;

	*)
	;;
esac
