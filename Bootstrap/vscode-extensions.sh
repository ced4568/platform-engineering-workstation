#!/usr/bin/env bash
set -euo pipefail

FILE="$HOME/Dev/GitHub/ced4568/platform-engineering-workstation/Dotfiles/vscode/extensions.txt"

echo "== Installing VS Code Extensions =="

while read -r EXT; do
    [ -z "$EXT" ] && continue
    code --install-extension "$EXT" --force
done < "$FILE"

echo "Done."
