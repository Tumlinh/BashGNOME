#!/bin/bash

# Prevent having empty workspaces by pushing windows from following workspaces
# Bug: focus lost

# Get current workspace's windows
ws=$(wmctrl -d | awk '{ if ($2 == "*") printf $1; }')

if [ -n $(wmctrl -l | grep "^[0-9a-fx]*  $ws") ]; then
	echo good
	for win in $(wmctrl -l | grep "^[0-9a-fx]*  $((ws+1))" | cut -d' ' -f1)
	do
		echo $win
		wmctrl -i -r $win -t $ws
	done
fi