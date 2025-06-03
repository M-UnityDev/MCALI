#!/bin/bash
POSITIONAL_ARGS=()
	case $1 in
		-c)
			case $2 in
				r)
					KittyConfig="$XDG_DATA_HOME/MCALR/thm/KittyRed.conf"
					ColorConfig="$XDG_DATA_HOME/MCALR/thm/ColorRed.css"
					HyprPaperConfig="$XDG_DATA_HOME/MCALR/thm/HyprPaperRed.conf"
					HyprLockConfig="$XDG_DATA_HOME/MCALR/thm/HyprRed.conf"
					HyprCursorConfig="$XDG_DATA_HOME/MCALR/thm/HyprCursorRed.conf"
					CursorTheme="Bibata-Original-Red"
					Wall="$XDG_DATA_HOME/MCALR/spr/WallRed.png"
					Logo="$XDG_DATA_HOME/MCALR/spr/LogoRed.png"
					;;
                g)
                    KittyConfig="$XDG_DATA_HOME/MCALR/thm/KittyGreen.conf"
                    ColorConfig="$XDG_DATA_HOME/MCALR/thm/ColorGreen.css"
					HyprPaperConfig="$XDG_DATA_HOME/MCALR/thm/HyprPaperGreen.conf"
					HyprLockConfig="$XDG_DATA_HOME/MCALR/thm/HyprGreen.conf"
					HyprCursorConfig="$XDG_DATA_HOME/MCALR/thm/HyprCursorGreen.conf"
					CursorTheme="Bibata-Original-Green"
					Wall="$XDG_DATA_HOME/MCALR/spr/WallGreen.png"
					Logo="$XDG_DATA_HOME/MCALR/spr/LogoGreen.png"
                    ;;
                b)
                    KittyConfig="$XDG_DATA_HOME/MCALR/thm/KittyBlue.conf"
                    ColorConfig="$XDG_DATA_HOME/MCALR/thm/ColorBlue.css"
					HyprPaperConfig="$XDG_DATA_HOME/MCALR/thm/HyprPaperBlue.conf"
					HyprLockConfig="$XDG_DATA_HOME/MCALR/thm/HyprBlue.conf"
					HyprCursorConfig="$XDG_DATA_HOME/MCALR/thm/HyprCursorBlue.conf"
					CursorTheme="Bibata-Original-Blue"
					Wall="$XDG_DATA_HOME/MCALR/spr/WallBlue.png"
					Logo="$XDG_DATA_HOME/MCALR/spr/LogoBlue.png"
                    ;;
                w)
					KittyConfig="$XDG_DATA_HOME/MCALR/thm/KittyBlack.conf"
                    ColorConfig="$XDG_DATA_HOME/MCALR/thm/ColorBlack.css"
					HyprPaperConfig="$XDG_DATA_HOME/MCALR/thm/HyprPaperBlack.conf"
					HyprLockConfig="$XDG_DATA_HOME/MCALR/thm/HyprBlack.conf"
					HyprCursorConfig="$XDG_DATA_HOME/MCALR/thm/HyprCursorBlack.conf"
					CursorTheme="Bibata-Original-Black"
					Wall="$XDG_DATA_HOME/MCALR/spr/WallBlack.png"
					Logo="$XDG_DATA_HOME/MCALR/spr/LogoBlack.png"
                    ;;
			esac
				;;
		-*|--*)
			echo "Unknown option $1"
			exit 1
			;;
	esac
set -- "${POSITIONAL_ARGS[@]}"
ChangeTheme () {
	HomeDirectory=$HOME
	ln -sf $HyprPaperConfig $HomeDirectory/.config/hypr/hyprpaper.conf
	ln -sf $HyprLockConfig $XDG_DATA_HOME/MCALR/thm/cur/HyprCurrent.conf
	ln -sf $HyprCursorConfig $XDG_DATA_HOME/MCALR/thm/cur/HyprCursorCurrent.conf
	hyprctl setcursor $CursorTheme 20 > /dev/null
	hyprctl hyprpaper preload $Wall > /dev/null
	hyprctl hyprpaper wallpaper ,$Wall > /dev/null
	hyprctl keyword decoration:screen_shader "~/.config/hypr/shaders/shake.glsl" > /dev/null
	ln -sf $Logo $XDG_DATA_HOME/MCALR/spr/cur/LogoCurrent.png
	ln -sf $KittyConfig $XDG_DATA_HOME/MCALR/thm/cur/KittyCurrent.conf
	ln -sf $ColorConfig $XDG_DATA_HOME/MCALR/thm/cur/ColorCurrent.css 
	killall waybar
	exec waybar &> /dev/null
}
ChangeTheme & disown
sleep 0.4
hyprctl keyword decoration:screen_shader ""
