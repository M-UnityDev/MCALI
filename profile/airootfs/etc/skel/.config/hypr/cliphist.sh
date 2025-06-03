#!/bin/bash
cd ~/.config/wofi
cliphist list | wofi --dmenu | cliphist decode | wl-copy
