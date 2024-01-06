nowPlaying=`playerctl metadata --format "{{artist}} / {{title}}"`

if [ "$nowPlaying" = "" ]; then
    echo "not playing"
else
    echo "playing: " $nowPlaying
fi;

