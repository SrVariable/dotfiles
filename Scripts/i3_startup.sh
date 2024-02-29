#!/bin/bash

nitrogen --restore &
picom &
setxkbmap -layout es,us -option grp:alt_space_toggle
setxkbmap -option ctrl:nocaps
i3-msg "workspace 2; exec i3-sensible-terminal"
i3-msg "workspace 1; exec brave-browser"
i3-msg "workspace 10; exec spotify"
i3-msg "workspace 9; exec discord"
