#!/usr/bin/env bash
set -euo pipefail

FILE="$HOME/Dev/GitHub/ced4568/platform-engineering-workstation/Dotfiles/vscode/extensions.txt"

echo "== Installing VS Code Extensions =="

if ! command -v code >/dev/null 2>&1; then
  echo "VS Code CLI not found. Skipping extensions."
  exit 0
fi

if [ ! -f "$FILE" ]; then
  echo "No extensions file found at $FILE"
  exit 0
fi

while read -r EXT; do
  [ -z "$EXT" ] && continue

  if code --list-extensions | grep -qx "$EXT"; then
    echo "Already installed: $EXT"
  else
    echo "Installing: $EXT"
    code --install-extension "$EXT" --force
  fi
done < "$FILE"

echo "== VS Code extensions complete =="
