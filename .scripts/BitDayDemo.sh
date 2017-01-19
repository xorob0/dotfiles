#!/bin/bash
#HOUR=`date +%H`
#QUART=`date +%q`
QUART=2
HOUR=0
while [ ! $HOUR -eq 25 ]
do

clear
if [ $QUART -eq 1 ] || [ $QUART -eq 4 ]
then
	if [ "$HOUR" -lt 4 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/11-Mid-Night.png
	elif [ "$HOUR" -lt 8 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/12-Late-Night.png
	elif [ "$HOUR" -lt 9 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/01-Early-Morning.png
	elif [ "$HOUR" -lt 10 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/02-Mid-Morning.png
	elif [ "$HOUR" -lt 11 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/03-Late-Morning.png
	elif [ "$HOUR" -lt 12 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/04-Early-Afternoon.png
	elif [ "$HOUR" -lt 13 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/05-Mid-Afternoon.png
	elif [ "$HOUR" -lt 15 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/06-Late-Afternoon.png
	elif [ "$HOUR" -lt 17 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/07-Early-Evening.png
	elif [ "$HOUR" -lt 18 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/08-Mid-Evening.png
	elif [ "$HOUR" -lt 19 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/09-Late-Evening.png
	elif [ "$HOUR" -lt 22 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/10-Early-Night.png
	else
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/11-Mid-Night.png
	fi
else
	if [ "$HOUR" -lt 4 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/11-Mid-Night.png
	elif [ "$HOUR" -lt 6 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/12-Late-Night.png
	elif [ "$HOUR" -lt 7 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/01-Early-Morning.png
	elif [ "$HOUR" -lt 9 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/02-Mid-Morning.png
	elif [ "$HOUR" -lt 10 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/03-Late-Morning.png
	elif [ "$HOUR" -lt 12 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/04-Early-Afternoon.png
	elif [ "$HOUR" -lt 14 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/05-Mid-Afternoon.png
	elif [ "$HOUR" -lt 17 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/06-Late-Afternoon.png
	elif [ "$HOUR" -lt 20 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/07-Early-Evening.png
	elif [ "$HOUR" -lt 21 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/08-Mid-Evening.png
	elif [ "$HOUR" -lt 22 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/09-Late-Evening.png
	elif [ "$HOUR" -lt 23 ]
	then
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/10-Early-Night.png
	else
		feh --bg-center $HOME/Pictures/Wallpapers/BitDay/11-Mid-Night.png
	fi
fi

echo "$HOUR"
((HOUR++))
sleep 1
done
