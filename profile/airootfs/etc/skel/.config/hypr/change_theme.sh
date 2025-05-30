#!/bin/bash
POSITIONAL_ARGS=()
	case $1 in
		-c)
			case $2 in
				r)
					KittyConfig="/ast/thm/KittyRed.conf"
					ColorConfig="/ast/thm/ColorRed.css"
					HyprPaperConfig="/ast/thm/HyprPaperRed.conf"
					HyprLockConfig="/ast/thm/HyprRed.conf"
					HyprCursorConfig="/ast/thm/HyprCursorRed.conf"
					CursorTheme="Bibata-Original-Red"
					Wall="/ast/spr/WallRed.png"
					Logo="/ast/spr/LogoRed.png"
					;;
                g)
                    KittyConfig="/ast/thm/KittyGreen.conf"
                    ColorConfig="/ast/thm/ColorGreen.css"
					HyprPaperConfig="/ast/thm/HyprPaperGreen.conf"
					HyprLockConfig="/ast/thm/HyprGreen.conf"
					HyprCursorConfig="/ast/thm/HyprCursorGreen.conf"
					CursorTheme="Bibata-Original-Green"
					Wall="/ast/spr/WallGreen.png"
					Logo="/ast/spr/LogoGreen.png"
                    ;;
                b)
                    KittyConfig="/ast/thm/KittyBlue.conf"
                    ColorConfig="/ast/thm/ColorBlue.css"
					HyprPaperConfig="/ast/thm/HyprPaperBlue.conf"
					HyprLockConfig="/ast/thm/HyprBlue.conf"
					HyprCursorConfig="/ast/thm/HyprCursorBlue.conf"
					CursorTheme="Bibata-Original-Blue"
					Wall="/ast/spr/WallBlue.png"
					Logo="/ast/spr/LogoBlue.png"
                    ;;
                w)
					KittyConfig="/ast/thm/KittyBlack.conf"
                    ColorConfig="/ast/thm/ColorBlack.css"
					HyprPaperConfig="/ast/thm/HyprPaperBlack.conf"
					HyprLockConfig="/ast/thm/HyprBlack.conf"
					HyprCursorConfig="/ast/thm/HyprCursorBlack.conf"
					CursorTheme="Bibata-Original-Black"
					Wall="/ast/spr/WallBlack.png"
					Logo="/ast/spr/LogoBlack.png"
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
	HomeDirectory=$HOME/
	cp -f $HyprPaperConfig $HomeDirectory.config/hypr/hyprpaper.conf
	cp -f $HyprLockConfig /ast/thm/cur/HyprCurrent.conf
	cp -f $HyprCursorConfig /ast/thm/cur/HyprCursorCurrent.conf
	hyprctl setcursor $CursorTheme 20 > /dev/null
	hyprctl hyprpaper preload $Wall > /dev/null
	hyprctl hyprpaper wallpaper ,$Wall > /dev/null
	hyprctl keyword decoration:screen_shader "~/.config/hypr/shaders/shake.glsl" > /dev/null
	ln -sf $Logo /ast/spr/cur/LogoCurrent.png
	cp -f $KittyConfig /ast/thm/cur/KittyCurrent.conf
	cp -f $ColorConfig /ast/thm/cur/ColorCurrent.css 
	killall waybar
	exec waybar &> /dev/null
}
ChangeTheme & disown
sleep 0.4
hyprctl keyword decoration:screen_shader ""
