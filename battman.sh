#!/bin/bash

# Battery monitor
capacity_min=10
{
while [ 1 ]; do
	capacity=$(cat /sys/class/power_supply/BAT0/capacity)
	status=$(cat /sys/class/power_supply/BAT0/status)
	if [[ $capacity -le $capacity_min ]] && [[ $status != "Charging" ]]; then
		canberra-gtk-play -i dialog-error
		sleep $((capacity*60/capacity_min))
	fi
	sleep 1
done
} &

# Screen locker
xset -dpms
xset s 600
timeout=610
{
while [ 1 ]; do
	if [[ $(xprintidle) -ge $((timeout*1000)) ]]; then
		slock
	fi
	sleep 1
done
} &