# Dit is een basis installatie script
# Installatie van alle progs
sudo dnf install hyprland \
waybar \
dunst \
kitty \
wl-clipboard \
grim \
slurp \
firefox \
fuzzel \
swaylock \
swayidle \
xdg-desktop-portal-hyprland \
xdg-desktop-portal-gtk \
network-manager-applet \
fira-code-fonts \
jetbrains-mono-fonts-all \
papirus-icon-theme \
thunar \
thunar-archive-plugin \
thunar-media-tags-plugin \
thunar-volman \
pactl \
brightnessctl \
swaybg \
fastfetch \
speedtest-cli \
vlc \
qutebrowser \
wayland-devel \
polkit 

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


	


