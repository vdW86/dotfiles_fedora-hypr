# Dit is een basis installatie script
# Installatie van alle progs
sudo zypper install alacritty foot \
cabextract 7zip p7zip-plugins \
dunst \
wl-clipboard qalculate featherpad geany zathura \
swaylock swayidle swaybg fuzzel \
fira-code-fonts jetbrains-mono-fonts papirus-icon-theme papirus-folders \
thunar-archive-plugin thunar-media-tags-plugin \
fastfetch speedtest-cli \
vlc gimp\
qutebrowser \
xdg-user-dirs \
keepassxc \
libreoffice-base libreoffice-l10n-nl

# Definieer mappen en hun bestanden in één associatieve array
declare -A configs=(
    [alacritty]="alacritty.toml keybinds.toml nordic.toml"
    [dunst]="dunstrc"
    [fuzzel]="fuzzel.ini"
    [hypr]="hyprland.conf"
    [kitty]="kitty.conf"
    [swaylock]="config backgrounds"
    [waybar]="config.jsonc style.css"
)

# Loop door alle entries: verwijder, maak aan, en symlink in één stap
for map in "${!configs[@]}"; do
    target_dir="$HOME/.config/$map"
    source_dir="$HOME/dotfiles/config/$map"

    # Verwijder de map als deze bestaat
    [ -d "$target_dir" ] && rm -rf "$target_dir"

    # Maak de map aan
    mkdir -p "$target_dir"

    # Symlink alle bestanden (als ze gedefinieerd zijn)
    for file in ${configs[$map]}; do
        [ -n "$file" ] && ln -sf "$source_dir/$file" "$target_dir/$file"
    done
done

# Bash aanpassen
cat >> ~/.bashrc <<EOF
source ~/dotfiles/bash/bash_aliases.sh
source ~/dotfiles/bash/bash_extra.sh
EOF

cat >> ~/.bash_profile <<EOF
# Source custom Hyprland autostart
[ -f "$HOME/dotfiles/bash/bash_profile.sh" ] && source "$HOME/dotfiles/bash/bash_profile.sh"
EOF

# Aanmaken van alle $USER folders
xdg-user-dirs-update
