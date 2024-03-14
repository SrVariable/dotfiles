#!/bin/bash

SESSIONS=("Magia" "42")

for i in "${SESSIONS[@]}"; do
	tmux has-session -t $i &> /dev/null
	if [ $? != 0 ]; then
		tmux new-session -s $i -n "main" -d
		tmux new-window -t $i: -n "test" -d
		tmux new-window -t $i: -n "temp" -d
		sleep 0.5
		tmux send-keys -t $i:test "cd $HOME/Magia/test" C-m; sleep 0.5
		tmux send-keys -t $i:test "clear" C-m; sleep 0.5
	fi
done

tmux send-keys -t ${SESSIONS[0]}:main "cd $HOME/GitRepos/roadmap-retos-programacion/Roadmap" C-m; sleep 0.5
tmux send-keys -t ${SESSIONS[0]}:main "clear" C-m; sleep 0.5
tmux send-keys -t ${SESSIONS[1]}:main "cd $HOME/GitRepos/push_swap" C-m; sleep 0.5
tmux send-keys -t ${SESSIONS[1]}:main "clear" C-m; sleep 0.5

tmux attach -t ${SESSIONS[0]}
