#!/bin/bash

chosen=$(printf "⏻  Uitzetten\n  Herstarten\n  Vergrendelen\n  Afmelden\n  Slaapstand" | \
fuzzel --dmenu --prompt "Systeem")

case "$chosen" in
    "⏻  Uitzetten") systemctl poweroff ;;
    "  Herstarten") systemctl reboot ;;
    "  Vergrendelen") hyprctl dispatch exec "swaylock" ;;   # vervang swaylock door jouw locktool
    "  Afmelden") hyprctl dispatch exit ;;
    "  Slaapstand") systemctl suspend ;;
esac

