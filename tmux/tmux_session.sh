#!/bin/bash

SESSIONS=("Magia" "42")

for i in "${SESSIONS[@]}"; do
	tmux has-session -t $i &> /dev/null
	if [ $? != 0 ]; then
		tmux new-session -s $i -n "main" -d
	fi
done

tmux attach -t ${SESSIONS[0]}
