nowPlaying=$(playerctl metadata --format "{{artist}} / {{title}}")

if [ "$nowPlaying" = "" ] || [ "$nowPlaying" = " / " ]; then
	exit
else
	echo "playing: " $nowPlaying
fi
