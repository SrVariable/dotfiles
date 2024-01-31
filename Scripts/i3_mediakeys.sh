#!/bin/bash

$(playerctl -l 2>&1 | grep "spotify" > /dev/null)

if [[ $? -eq 0 ]]; then
	if [[ $1 -eq 1 ]]; then
		playerctl -p spotify play-pause
	elif [[ $1 -eq 2 ]]; then
		playerctl -p spotify next
	elif [[ $1 -eq 3 ]]; then
		playerctl -p spotify previous
	fi
else
	if [[ $1 -eq 1 ]]; then
		playerctl play-pause
	elif [[ $1 -eq 2 ]]; then
		playerctl next
	elif [[ $1 -eq 3 ]]; then
		playerctl previous
	fi
fi
