#!/bin/sh
# find the folder to open in tmux session
cd $(fzf --walker=,dir,hidden --walker-root=$HOME/Codes)
# // check the session is there or not

if tmux has-session  2>/dev/null; then
    echo "Session $SESSION_NAME already exists. Attaching to it."
    tmux attach-session -t "$SESSION_NAME"
    exit 0
fi

tmux new-session -d -s "$SESSION_NAME"
# Split the session into panes (optional)
tmux split-window -h
tmux split-window -v
tmux attach-session -t "$SESSION_NAME"
