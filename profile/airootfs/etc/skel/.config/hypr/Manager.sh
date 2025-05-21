#!/bin/bash
stop () {
	hyprctl keyword decoration:shadow:enabled false 
	exit
}
[[ $(date +%b) = "Dec" || $(date +%b) = "Jan" ]] && hyprctl keyword decoration:shadow:enabled true || stop
coloractivenumber=$((($RANDOM%3)+1))
colorinactivenumber=$((($RANDOM%3)+1))
red=4284678144
green=4278215424
blue=4278190179
[ $coloractivenumber = 1 ] && hyprctl keyword decoration:shadow:color $red
[ $coloractivenumber = 2 ] && hyprctl keyword decoration:shadow:color $green
[ $coloractivenumber = 3 ] && hyprctl keyword decoration:shadow:color $blue
[ $colorinactivenumber = 1 ] && hyprctl keyword decoration:shadow:color_inactive $red
[ $colorinactivenumber = 2 ] && hyprctl keyword decoration:shadow:color_inactive $green
[ $colorinactivenumber = 3 ] && hyprctl keyword decoration:shadow:color_inactive $blue
