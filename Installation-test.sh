#!/bin/bash

# Pakketten installeren
sudo dnf install -y hyprland waybar dunst kitty wl-clipboard grim slurp firefox fuzzel swaylock swayidle xdg-desktop-portal-hyprland xdg-desktop-portal-gtk network-manager-applet fira-code-fonts jetbrains-mono-fonts-all papirus-icon-theme thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman pulseaudio-utils brightnessctl swaybg fastfetch speedtest-cli vlc qutebrowser

# Directorys aanmaken
mkdir -p ~/.config/{dunst,fuzzel,hypr,waybar}

# Symbolic links maken (met check)
for file in dunstrc fuzzel.ini hyprland.conf config.jsonc style.css; do
    if [ -f ~/dotfiles/config/$(dirname $file)/$file ]; then
        ln -sf ~/dotfiles/config/$(dirname $file)/$file ~/.config/$(dirname $file)/$file
    else
        echo "Warning: ~/dotfiles/config/$(dirname $file)/$file does not exist!"
    fi
done

# Bash-configuratie
if [ -f ~/dotfiles/bash/bash_aliases.sh ]; then
    echo "source ~/dotfiles/bash/bash_aliases.sh" >> ~/.bashrc
fi
if [ -f ~/dotfiles/bash/bash_extra.sh ]; then
    echo "source ~/dotfiles/bash/bash_extra.sh" >> ~/.bashrc
fi
if [ -f ~/dotfiles/bash/bash_profile.sh ]; then
    echo "[ -f \"$HOME/dotfiles/bash/bash_profile.sh\" ] && source \"$HOME/dotfiles/bash/bash_profile.sh\"" >> ~/.bash_profile
fi

echo "Installatie en configuratie voltooid!"


