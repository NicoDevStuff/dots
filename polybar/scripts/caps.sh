#!/bin/bash
#
if [ $(xset -q | sed -n 's/^.*Caps Lock:\s*\(\S*\).*$/\1/p') = "on" ]; then
	echo "⬆"
else
	echo "⬇"
fi
