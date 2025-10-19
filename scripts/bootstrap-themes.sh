#!/usr/bin/env bash
# Bootstrap script voor alle themes vanuit dotfiles

DOTFILES="$HOME/dotfiles/config/themes"

mkdir -p ~/.themes
mkdir -p ~/.icons

# GTK Themes
for theme in "$DOTFILES/gtk"/*; do
    name=$(basename "$theme")
    ln -sfn "$theme" ~/.themes/"$name"
    echo "[OK] GTK theme gelinkt: $name"
done

# Icon Themes
for icon in "$DOTFILES/icons"/*; do
    name=$(basename "$icon")
    ln -sfn "$icon" ~/.icons/"$name"
    echo "[OK] Icon theme gelinkt: $name"
done

# Cursor Themes (ook via ~/.icons)
for cursor in "$DOTFILES/cursors"/*; do
    name=$(basename "$cursor")
    ln -sfn "$cursor" ~/.icons/"$name"
    echo "[OK] Cursor theme gelinkt: $name"
done

# Starship
if [ -f "$DOTFILES/starship/starship.toml" ]; then
    mkdir -p ~/.config
    ln -sfn "$DOTFILES/starship/starship.toml" ~/.config/starship.toml
    echo "[OK] Starship config gelinkt"
fi

echo "Klaar! 🎉"
