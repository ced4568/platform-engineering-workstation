#!/usr/bin/env bash
set -euo pipefail

echo "== Configuring VS Code =="

if ! command -v code >/dev/null 2>&1; then
  echo "VS Code CLI not found. Install VS Code first."
  exit 0
fi

"$HOME/Dev/GitHub/ced4568/platform-engineering-workstation/Bootstrap/vscode-extensions.sh"

echo "== VS Code complete =="
