# Kill previous session
tmux kill-session -t daemon
tmux kill-session -t proxy
tmux kill-session -t musicfox

export INTERVAL=0.3

# Music
tmux new-session -d -s musicfox -n musicfox -d "musicfox"
sleep $INTERVAL

# System daemon
tmux new-session -d -s daemon -n waybar -d "waybar"
sleep $INTERVAL

tmux split-window -t daemon -d "hyprpaper"
sleep $INTERVAL

tmux split-window -t daemon -d "start-pulseaudio-x11"

# proxy
tmux new-session -d -s proxy -d "sudo v2rayA"

# Launch Applications
kitty &
sleep $INTERVAL
hyprctl dispatch movetoworkspace 2
sleep $INTERVAL

firefox &
sleep $INTERVAL
hyprctl dispatch movetoworkspace 6
sleep $INTERVAL

discord &
sleep $INTERVAL
hyprctl dispatch movetoworkspace 2
sleep $INTERVAL

neovide &
sleep $INTERVAL
hyprctl dispatch movetoworkspace 1
sleep $INTERVAL

kitty tmux attach-session -t proxy & # prompt for password, so focus on this

sleep 15                         # wait musicfox loading + proxy booting
tmux send-keys -t musicfox space # start playing
