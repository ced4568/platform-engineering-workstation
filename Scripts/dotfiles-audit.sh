#!/usr/bin/env bash
set -euo pipefail

echo "== Dotfiles Audit =="

for file in \
  Dotfiles/alacritty/alacritty.toml \
  Dotfiles/bash/bashrc \
  Dotfiles/git/gitconfig \
  Dotfiles/starship/starship.toml \
  Dotfiles/tmux/tmux.conf \
  Dotfiles/vscode/extensions.txt
do
  if [ -f "$file" ]; then
    echo "✅ $file"
  else
    echo "❌ Missing: $file"
  fi
done

echo
echo "SSH config is allowed only if it contains host aliases and no private keys."
if [ -f Dotfiles/ssh/config ]; then
  echo "✅ Dotfiles/ssh/config exists"
else
  echo "⚠️  Dotfiles/ssh/config missing"
fi
