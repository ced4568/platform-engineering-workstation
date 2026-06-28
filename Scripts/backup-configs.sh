#!/usr/bin/env bash
set -euo pipefail

REPO="$HOME/Dev/GitHub/ced4568/platform-engineering-workstation"
STAMP="$(date +%Y%m%d-%H%M%S)"
DEST="$REPO/Backups/configs-$STAMP"

echo "== Backing up workstation configs =="

mkdir -p "$DEST"

cp -a "$HOME/.bashrc" "$DEST/bashrc" 2>/dev/null || true
cp -a "$HOME/.gitconfig" "$DEST/gitconfig" 2>/dev/null || true
cp -a "$HOME/.config/starship.toml" "$DEST/starship.toml" 2>/dev/null || true
cp -a "$HOME/.config/alacritty" "$DEST/alacritty" 2>/dev/null || true
cp -a "$HOME/.ssh/config" "$DEST/ssh-config" 2>/dev/null || true

echo "Backup created: $DEST"
