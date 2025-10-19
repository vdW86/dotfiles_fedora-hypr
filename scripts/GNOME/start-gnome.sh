#!/bin/bash
# ~/dotfiles/scripts/start-sddm.sh
# Start SDDM op TTY3 zodat GNOME beschikbaar is

# Controleer of script uitvoerbaar is
if [ ! -x "$(command -v systemctl)" ]; then
    echo "systemctl niet gevonden!"
    exit 1
fi

# Start SDDM op TTY3
sudo SDDMVT=/dev/tty3 systemctl start sddm
