#!/bin/bash

WALLS_DIR="$HOME/Pictures/Backgrounds"

wall=$(ls "$WALLS_DIR" | fuzzel --dmenu)

if [[ -n "$wall" ]]; then
    swww img "$WALLS_DIR/$wall" \
        --transition-type wipe \
        --transition-angle 30 \
        --transition-step 90 \
        --transition-fps 144
fi

