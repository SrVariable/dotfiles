#!/bin/bash

nitrogen --restore &
picom &
xmodmap -e "keycode 66 = NoSymbol"
setxkbmap -layout es,us -option grp:alt_space_toggle
