#!/bin/bash

battery=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage" | awk '{ print $2 }' | tr -d "%")

if [[ $battery -ge 80 ]]; then
	echo " $battery%"
elif [[ $battery -ge 50 ]]; then
	echo " $battery%"
else
	echo " $battery%"
fi
