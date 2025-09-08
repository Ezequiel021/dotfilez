#!/bin/bash

case $1 in
    laptop)
    echo "Display only in laptop";
    cat ~/.config/hypr/config/monitor/laptop.conf > ~/.config/hypr/config/monitor/monitor.conf
    ;;

    external)
    echo "Display only in external monitor";
    cat ~/.config/hypr/config/monitor/external.conf > ~/.config/hypr/config/monitor/monitor.conf
    ;;

    extend)
    echo "Extend desktop";
    cat ~/.config/hypr/config/monitor/extend.conf > ~/.config/hypr/config/monitor/monitor.conf
    ;;

    mirror)
    echo "Mirror desktop";
    cat ~/.config/hypr/config/monitor/mirror.conf > ~/.config/hypr/config/monitor/monitor.conf
    ;;

    *) 
    echo "default option"
    cat ~/.config/hypr/config/monitor/default.conf > ~/.config/hypr/config/monitor/monitor.conf
    ;;
esac
