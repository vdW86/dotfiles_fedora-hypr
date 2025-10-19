#!/usr/bin/env bash
# Installatie & update van swaylock-effects vanuit dotfiles

set -e

# Locatie in je dotfiles
DOTFILES="$HOME/dotfiles/config/swaylock-effects"
REPO="https://github.com/jirutka/swaylock-effects.git"

# Dependencies installeren (Fedora)
sudo dnf install -y meson ninja wlroots-devel cairo-devel pango-devel \
  pam-devel git libevdev-devel libxkbcommon-devel systemd-devel uthash-devel libseat-devel \
  wayland-protocols-devel

# Clone of update van de repo in dotfiles
if [ -d "$DOTFILES" ]; then
    echo "[INFO] swaylock-effects repo bestaat, update..."
    git -C "$DOTFILES" pull
else
    echo "[INFO] Clonen van swaylock-effects naar dotfiles..."
    git clone "$REPO" "$DOTFILES"
fi

# Builden
cd "$DOTFILES"
if [ -d build ]; then
    echo "[INFO] Herconfigureren en rebuild..."
    meson build --reconfigure
else
    echo "[INFO] Nieuwe build map aanmaken..."
    meson build
fi

ninja -C build
sudo ninja -C build install
echo "[OK] swaylock-effects geïnstalleerd/updated"

# Config symlink naar ~/.config
mkdir -p ~/.config/swaylock-effects
if [ -f "$DOTFILES/swaylock.conf" ]; then
    ln -sfn "$DOTFILES/swaylock.conf" ~/.config/swaylock-effects/swaylock.conf
    echo "[OK] Symlink naar config gelegd"
else
    echo "[INFO] Geen swaylock.conf gevonden in dotfiles, maak er een aan om te configureren."
fi

echo "[KLAAR] Je kunt nu swaylock-effects gebruiken in Hyprland"
