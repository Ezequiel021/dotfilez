#!/bin/bash

wal -i $1 -e;
hyprctl hyprpaper reload ",$1"
