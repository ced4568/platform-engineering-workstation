#!/usr/bin/env bash
set -euo pipefail

REPO="$HOME/Dev/GitHub/ced4568/platform-engineering-workstation"
MARKER="# --- Platform Engineering Workstation ---"

echo "== Deploying dotfiles =="

mkdir -p "$HOME/.config/alacritty" "$HOME/.config" "$HOME/.ssh" "$REPO/Backups"

backup_file() {
  local file="$1"
  if [ -f "$file" ]; then
    cp "$file" "$REPO/Backups/$(basename "$file").bak.$(date +%Y%m%d%H%M%S)"
  fi
}

backup_file "$HOME/.bashrc"
backup_file "$HOME/.config/starship.toml"
backup_file "$HOME/.config/alacritty/alacritty.toml"
backup_file "$HOME/.gitconfig"

if grep -q "$MARKER" "$HOME/.bashrc"; then
  echo "Bash workstation block already exists. Skipping Bash append."
else
  cat "$REPO/Dotfiles/bash/bashrc" >> "$HOME/.bashrc"
fi

cp "$REPO/Dotfiles/starship/starship.toml" "$HOME/.config/starship.toml"
cp "$REPO/Dotfiles/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
cp "$REPO/Dotfiles/git/gitconfig" "$HOME/.gitconfig"

echo "== Dotfiles deployed =="
