#!/usr/bin/env bash
set -euo pipefail

REPO="$HOME/Dev/GitHub/ced4568/platform-engineering-workstation"
EXTENSIONS="$REPO/Dotfiles/vscode/extensions.txt"

echo "== Configuring VS Code =="

if ! command -v code >/dev/null 2>&1; then
  echo "VS Code CLI not found. Install VS Code first."
  exit 1
fi

if [ -f "$EXTENSIONS" ]; then
  while read -r extension; do
    [ -z "$extension" ] && continue
    echo "Installing extension: $extension"
    code --install-extension "$extension" --force
  done < "$EXTENSIONS"
fi

echo "== VS Code complete =="
