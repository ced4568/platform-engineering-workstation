#!/usr/bin/env bash
set -euo pipefail

echo "== Configuring direnv =="

if ! command -v direnv >/dev/null 2>&1; then
  sudo nala install -y direnv
fi

if ! grep -q "direnv hook bash" "$HOME/.bashrc"; then
  cat >> "$HOME/.bashrc" <<'BASH_EOF'

# direnv
eval "$(direnv hook bash)"
BASH_EOF
fi

direnv version
echo "== direnv complete =="
