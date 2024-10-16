#!/bin/sh

nm-applet &
picom &
nitrogen --restore
volumeicon &
dunst &
udiskie -t &
redshift-gtk &

xrandr --output DP-3 --auto --output DP-5 --auto --primary --right-of DP-3
xset s off
xset -dpms

check-update-time.sh
# ~/.config/polybar/launch.sh &
