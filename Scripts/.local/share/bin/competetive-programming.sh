#!/bin/sh
URL="https://earthshakira.github.io/a2oj-clientside/server/Ladders.html"
xdg-open "$URL"
URL="https://takeuforward.org/interviews/strivers-sde-sheet-top-coding-interview-problems/"
xdg-open "$URL"

cd ~/Codes/cp
SESSION_NAME="codeforces"
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "Session $SESSION_NAME already exists. Attaching to it."
    tmux attach-session -t $SESSION_NAME
else
    tmux new-session -d -s $SESSION_NAME
    tmux rename-window $SESSION_NAME
    # split vertically for input
    tmux split-window -h
    tmux resize-pane -R 20
    # open the files
    tmux send-keys -t 0 'vim main.cpp' C-m
    tmux send-keys -t 1 'vim input.txt' C-m
    # select the main pane
    tmux select-pane -t 0
    # Attach to the created session
    tmux attach-session -t $SESSION_NAME
fi
