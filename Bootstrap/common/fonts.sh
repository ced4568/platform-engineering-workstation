#!/usr/bin/env bash
set -euo pipefail

echo "== Installing JetBrains Mono Nerd Font =="

FONT_DIR="$HOME/.local/share/fonts"
TMP_DIR="/tmp/jetbrainsmono-nerdfont"

mkdir -p "$FONT_DIR"

if fc-list | grep -qi "JetBrainsMono Nerd Font"; then
  echo "JetBrains Mono Nerd Font already installed."
else
  rm -rf "$TMP_DIR"
  mkdir -p "$TMP_DIR"

  curl -L --fail -o "$TMP_DIR/JetBrainsMono.zip" \
    https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

  unzip -q "$TMP_DIR/JetBrainsMono.zip" -d "$TMP_DIR/JetBrainsMono"
  cp "$TMP_DIR/JetBrainsMono"/*.ttf "$FONT_DIR/"
  fc-cache -f "$FONT_DIR"
fi

fc-list | grep -i "JetBrainsMono Nerd Font" | head -3 || true
echo "== Fonts complete =="
