#!/bin/bash
# baraction.sh for spectrwm status bar

bar=""
delim="|"
SLEEP_SEC=3

add_element() {
	bar="$bar $1 $delim"
}

vol() {
    if [ $(pamixer --get-mute) = "true" ]; then
        echo " 🔇 "
    else
        echo " 🔊 $(pamixer --get-volume)% "
    fi
}

status() {
	add_element "$(vol)"
	add_element "💻 $(echo ""$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"% ")"
	add_element "🔥 $(echo "$(sensors | grep "Package id 0:" | tr -d '+' | awk '{print $4}')")"
	add_element "🧠 $(echo "$(awk '/MemTotal/ {total=$2} /MemAvailable/ {available=$2} END {printf("%.2f%%\n", (total - available) / total * 100)}' /proc/meminfo)")"
	add_element "📆 $(date +%F)"
	add_element "🕒 $(date +%H:%M)"
	echo $bar
}

while :; do
	bar=""
	status
	sleep $SLEEP_SEC
done
