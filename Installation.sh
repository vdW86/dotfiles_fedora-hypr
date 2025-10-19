# Dit is een basis installatie script
# hij maakt de mappen aan van de progs die gebruikt worden
# Verder maakt hij links aan

# Directorys aanmaken
mkdir ~/.config/{dunst,fuzzel,hypr,waybar}

# symbolic link
ln -s ~/dotfiles/config/dunst/dunstrc ~/.config/dunst/dunstrc
ln -s ~/dotfiles/config/fuzzel/fuzzel.ini ~/.config/fuzzel/fuzzel.ini
ln -s ~/dotfiles/config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf 
ln -s ~/dotfiles/config/waybar/config.jsonc ~/.config/waybar/config.jsonc
ln -s ~/dotfiles/config/waybar/style.css ~/.config/waybar/style.css

# Bash aanpassen
cat >> ~/.bashrc <<EOF
source ~/dotfiles/bash/bash_aliases.sh
source ~/dotfiles/bash/bash_extra.sh
EOF

cat >> ~/.bash_profile <<EOF
# Source custom Hyprland autostart
[ -f "$HOME/dotfiles/bash/bash_profile.sh" ] && source "$HOME/dotfiles/bash/bash_profile.sh"
EOF


	


