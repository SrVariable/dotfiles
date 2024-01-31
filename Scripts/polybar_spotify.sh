#!/bin/bash

artist=$(playerctl -p spotify metadata --format '{{artist}}')
title=$(playerctl -p spotify metadata --format '{{title}}')
trimmed_title=${title%%[-(]*}

printf " ${artist} - ${trimmed_title}"
