#!/bin/bash
picom -cCGfF -o 0.38 -O 200 -I 200 -t 0 -l 0 -r 3 -D2 -m 0.88 &
xfsettingsd & # for theme settings
pasystray &
xfce4-power-manager &
nm-applet &
xfce4-clipman &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
feh --bg-scale /home/tux/Pictures/Wallpapers/ibelieve2.png &
slstatus &
syncthing &
xautolock -time 60 -locker slock &
/home/tux/.screenlayout/default.sh & 
key-mapper-service &

exec dwm
