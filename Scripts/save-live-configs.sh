#!/usr/bin/env bash
set -euo pipefail

REPO="$HOME/Dev/GitHub/ced4568/platform-engineering-workstation"

echo "== Saving live configs to repo =="

cp "$HOME/.config/alacritty/alacritty.toml" "$REPO/Dotfiles/alacritty/alacritty.toml"
cp "$HOME/.config/starship.toml" "$REPO/Dotfiles/starship/starship.toml"
cp "$HOME/.gitconfig" "$REPO/Dotfiles/git/gitconfig"
cp "$HOME/.ssh/config" "$REPO/Dotfiles/ssh/config"

echo "Saved live configs. Review with: git diff"
