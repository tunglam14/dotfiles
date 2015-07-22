#! /bin/bash

SESSNAME='lam-ws'
CODEDIR='/home/lamdt/Code'

tmux new -d -s $SESSNAME

tmux set-option default-path "$CODEDIR"

tmux history-limit 99999

tmux rename-window -t $SESSNAME:0 'ruby'

# On window 0
tmux select-window -t $SESSNAME:0

# Create pane 0
tmux split-window -h -p 50 -c "$CODEDIR/ruby"

# Create pane 1, height 70%
tmux split-window -v -p 70 -c "$CODEDIR/ruby"

# Create pane 2 & 3
tmux split-window -v -p 50 -c "$CODEDIR/ruby"

# New window with python
tmux new-window -t $SESSNAME:1 -n 'python' "cd $CODEDIR/python; . .env/bin/activate; ipython"

# New window with mongo connection
tmux new-window -t $SESSNAME:2 -n 'mongo' "mongo 1.1.1.1/dbname"

tmux select-window -t $SESSNAME:0
tmux select-pane -t 0

tmux -2 attach -t $SESSNAME
