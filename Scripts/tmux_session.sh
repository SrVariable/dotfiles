#!/bin/bash

SESSIONS=("Magia" "42")

for i in "${SESSIONS[@]}"; do
	tmux has-session -t $i &> /dev/null
	if [ $? != 0 ]; then
		tmux new-session -s $i -n "main" -d
		tmux new-window -t $i: -n "test" -d
		tmux new-window -t $i: -n "temp" -d
		tmux send-keys -t $i:test "cd ~/Magia/test" C-m
		tmux send-keys -t $i:test "clear" C-m
	fi
done

tmux send-keys -t ${SESSIONS[0]}:main "cd ~/GitRepos/roadmap-retos-programacion/Roadmap" C-m
tmux send-keys -t ${SESSIONS[0]}:main "clear" C-m
tmux send-keys -t ${SESSIONS[1]}:main "cd ~/Magia/test/c/push_swap2" C-m
tmux send-keys -t ${SESSIONS[1]}:main "clear" C-m

tmux attach -t ${SESSIONS[0]}
