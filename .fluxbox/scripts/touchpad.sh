#!/bin/bash

# Modify here to fit your hardware
DEVICE_ID=$(xinput list |  grep "ETPS/2 Elantech Touchpad" | sed 's/.*id=\([0-9]*\).*/\1/')

if (( $# > 0 )); then
	if [[ "$1" -eq 0 ]]; then
		xinput disable $DEVICE_ID
	elif [[ "$1" -eq 1 ]]; then
		xinput enable $DEVICE_ID
	fi
else
	if [[ -z `xinput -list-props $DEVICE_ID | grep "Device Enabled" | grep "1$"` ]]; then
		xinput enable $DEVICE_ID
	else	xinput disable $DEVICE_ID
	fi
fi
