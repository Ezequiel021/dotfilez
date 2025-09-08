#!/bin/bash
playerctl --follow metadata --format '{{artist}} - {{title}}' | while read -r track; do
    if [[ "$track" != "$last_track" ]]; then
        last_track="$track"
        bash ~/.config/backup/scripts/spotify_color.sh > ~/.config/theme/spotify.css
    fi
done
