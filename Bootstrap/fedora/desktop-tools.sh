#!/usr/bin/env bash
set -euo pipefail

echo "== Installing Fedora Desktop Tools =="

mkdir -p "$HOME/.local/bin"

if ! command -v alacritty >/dev/null 2>&1; then
  sudo dnf install -y alacritty
else
  echo "Alacritty already installed."
fi

if ! command -v starship >/dev/null 2>&1; then
  curl -fsSL https://starship.rs/install.sh \
    | sh -s -- --yes --bin-dir "$HOME/.local/bin"
else
  echo "Starship already installed."
fi

if ! command -v code >/dev/null 2>&1; then
  vscode_rpm="/tmp/vscode-stable.rpm"

  curl -L --fail \
    "https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-x64" \
    -o "$vscode_rpm"

  sudo dnf install -y "$vscode_rpm"
  rm -f "$vscode_rpm"
else
  echo "VS Code already installed."
fi

echo
echo "Versions:"
alacritty --version
starship --version | head -1
code --version | head -1

echo "== Fedora desktop tools complete =="
