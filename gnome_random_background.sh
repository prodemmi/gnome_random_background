#!/bin/bash

date_now=$(date '+%Y-%m-%d_%H:%M:%S')
RESOLUTION=$(cat /sys/class/graphics/*/virtual_size | sed 's/,/x/g')
IS_OK=$(wget --timeout=20 -O /tmp/wallpaper.jpg https://source.unsplash.com/$RESOLUTION 2>&1 | grep -c '200 OK')

if [ $IS_OK == 1 ];then

    mkdir -p $HOME/Pictures/Wallpapers/unsplash/
    cp /tmp/wallpaper.jpg $HOME/Pictures/Wallpapers/unsplash/"$date_now.jpg"
    gsettings set org.gnome.desktop.background picture-uri file://$HOME/Pictures/Wallpapers/unsplash/"$date_now.jpg"
    
else

    echo "Something wrong."

fi