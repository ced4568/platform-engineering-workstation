#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SOURCE_FILE="$REPO_ROOT/Dotfiles/bash/bashrc"
BASHRC="$HOME/.bashrc"
MARKER="# --- Platform Engineering Workstation ---"

echo "== Configuring Bash =="

touch "$BASHRC"

if [ ! -f "$SOURCE_FILE" ]; then
  echo "Missing Bash configuration: $SOURCE_FILE"
  exit 1
fi

if grep -qF "$MARKER" "$BASHRC"; then
  echo "Existing workstation Bash block found. Skipping append."
else
  {
    echo
    cat "$SOURCE_FILE"
    echo
  } >> "$BASHRC"

  echo "Platform Engineering Workstation Bash block added."
fi

echo "== Bash config complete =="
