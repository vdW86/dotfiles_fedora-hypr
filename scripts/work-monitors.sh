#!/bin/bash

# Externe setup: DP-4 (links), DP-3 (midden), eDP-1 (rechts)
#hyprctl keyword monitor "DP-4, preferred, 0x0, 1"
hyprctl keyword monitor "DP-3, preferred, 1920x0, 1"
hyprctl keyword monitor "eDP-1, preferred, 3840x0, 1"
