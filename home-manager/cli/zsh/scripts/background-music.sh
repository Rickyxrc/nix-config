export INTERVAL=0.6
tmux kill-session -t musicfox
sleep $INTERVAL
tmux new-session -d -s musicfox -n musicfox -d "musicfox"
sleep 10
tmux send-keys -t musicfox space # start playing
