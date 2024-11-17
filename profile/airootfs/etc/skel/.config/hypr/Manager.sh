#!/usr/bin/env bash
[ $(date +%b) = "Dec" ] && hyprctl keyword decoration:shadow:enabled true || hyprctl keyword decoration:shadow:enabled false
