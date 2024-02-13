nowPlaying=$(playerctl metadata --format "{{artist}} / {{title}}")

if [ "$nowPlaying" = "" ] || [ "$nowPlaying" = " / " ]; then
else
	echo "playing: " $nowPlaying
fi
