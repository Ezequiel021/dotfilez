#!/bin/bash
swww-daemon -f xrgb &
BACK_PID=$!
wait $BACK_PID
swww img /home/ramos/Pictures/fontaine.jpeg