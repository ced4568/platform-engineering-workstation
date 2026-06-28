#!/usr/bin/env bash
set -euo pipefail

REPO="$HOME/Dev/GitHub/ced4568/platform-engineering-workstation"

echo "== Saving live configs to repo =="

cp "$HOME/.config/alacritty/alacritty.toml" "$REPO/Dotfiles/alacritty/alacritty.toml"
cp "$HOME/.config/starship.toml" "$REPO/Dotfiles/starship/starship.toml"

# Keep Git config canonical from Dotfiles/git/gitconfig.
# Do not overwrite it from ~/.gitconfig because Git may reorder/format values.

if [ -f "$HOME/.ssh/config" ]; then
  cp "$HOME/.ssh/config" "$REPO/Dotfiles/ssh/config"
fi

echo "Saved live configs. Review with: git diff"
