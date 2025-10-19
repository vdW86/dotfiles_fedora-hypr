#!/bin/bash

# Ga naar de dotfiles map
cd ~/dotfiles || { echo "Kon de dotfiles map niet vinden."; exit 1; }

# Voeg alle wijzigingen toe
git add .

# Vraag om een commit boodschap
echo "Voer een commit boodschap in:"
read -r commit_message

# Als er geen boodschap is ingevuld, gebruik een standaard boodschap
if [ -z "$commit_message" ]; then
    commit_message="Update dotfiles $(date +'%Y-%m-%d')"
fi

# Commit de wijzigingen
git commit -m "$commit_message"

# Push naar GitHub
git push origin main

echo "Dotfiles zijn bijgewerkt en gepusht naar GitHub!"
