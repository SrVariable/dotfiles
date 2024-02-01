#!/bin/bash

if playerctl -p spotify metadata > /dev/null 2>&1; then
	artist=$(playerctl -p spotify metadata --format '{{artist}}')
	title=$(playerctl -p spotify metadata --format '{{title}}')
	trimmed_title=${title%%[-(]*}
	printf " ${artist} - ${trimmed_title}"
else
	printf " Segmentation - Fault"
fi
