#!/usr/bin/env bash
# --- User Aliases ---

# Edit scripts/config files quickly
alias basha="vi ~/dotfiles/bash/bash_aliases.sh"
alias bashe="vi ~/dotfiles/bash/bash_extra.sh"
alias bashp="vi ~/dotfiles/bash/bash_profile.sh" 
alias bashrc="vi ~/.bashrc"

# DNF package shortcuts
alias pac="sudo dnf install"
alias pacu="sudo dnf upgrade"
alias pacs="dnf search"
alias pacc="sudo dnf autoremove"
alias pacr="sudo dnf remove"

alias listpacu="dnf list --installed"
alias pacsco="dnf list --installed | grep"

# Config editors
alias hypr="vi ~/dotfiles/config/hypr/hyprland.conf"
alias wbar="vi ~/dotfiles/config/waybar/config.jsonc"
alias kit="vi ~/dotfiles/config/waybar/config.jsonc"
alias fuz="vi ~/dotfiles/config/fuzzel/fuzzel.ini"
alias lck="vi ~/dotfiles/scripts/auto_lock.sh"

# Btrfs helpers
alias btdu="sudo btrfs filesystem df /"
alias btuse="sudo btrfs filesystem usage /"
alias btdf='sudo btrfs filesystem usage -h / | grep -E "Device size|Used:|Free "'

# Network/test
alias speed="speedtest-cli --simple"

# GNOME shortcut
alias gnome="~/dotfiles/scripts/GNOME/start-gnome.sh"
