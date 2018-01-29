#!/bin/bash
# Tool for changing window geometry interactively

geometry=$(xwininfo -id $(xdotool getactivewindow))
x=$(printf "$geometry" | grep "Absolute upper-left X:" | cut -d ":" -f2 | awk '{print $1}')
y=$(printf "$geometry" | grep "Absolute upper-left Y:" | cut -d ":" -f2 | awk '{print $1}')
w=$(printf "$geometry" | grep "Width:" | cut -d ":" -f2 | awk '{print $1}')
h=$(printf "$geometry" | grep "Height:" | cut -d ":" -f2 | awk '{print $1}')

w2=$(zenity --entry --title="Change window geometry" --text="Width:\t" --entry-text="$w")
[ $? == 1 ] && w2=$w
h2=$(zenity --entry --title="Change window geometry" --text="Height:\t" --entry-text="$h")
[ $? == 1 ] && h2=$h
x2=$(zenity --entry --title="Change window geometry" --text="X position:\t" --entry-text="$x")
[ $? == 1 ] && x2=$x
y2=$(zenity --entry --title="Change window geometry" --text="Y position:\t" --entry-text="$y")
[ $? == 1 ] && y2=$y

sleep 0.1
wmctrl -r :ACTIVE: -e 0,$x2,$y2,$w2,$h2
