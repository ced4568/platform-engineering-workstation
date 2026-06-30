#!/usr/bin/env bash
set -euo pipefail

echo "== Configuring tmux =="

if ! command -v tmux >/dev/null 2>&1; then
  sudo nala install -y tmux
fi

cp "$HOME/Dev/GitHub/ced4568/platform-engineering-workstation/Dotfiles/tmux/tmux.conf" "$HOME/.tmux.conf"

tmux -V
echo "== tmux complete =="
