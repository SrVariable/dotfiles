#!/bin/bash

nitrogen --restore &
picom &
setxkbmap -layout es,us -option grp:alt_space_toggle
setxkbmap -option ctrl:nocaps
i3-msg "exec brave-browser"
i3-msg "workspace 2; exec i3-sensible-terminal"
i3-msg "exec spotify"
i3-msg "exec discord"
$HOME/GitRepos/Scripts/Bash/set_system_appearance.sh --gray
