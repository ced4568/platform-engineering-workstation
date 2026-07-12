#!/usr/bin/env bash
set -euo pipefail

echo "== Configuring Fedora Platform Tools =="

required_commands=(
  make
  shellcheck
  yamllint
  pre-commit
  ansible
  ansible-lint
  pipx
  direnv
  tmux
)

missing=()

for command_name in "${required_commands[@]}"; do
  if command -v "$command_name" >/dev/null 2>&1; then
    echo "Found: $command_name"
  else
    echo "Missing: $command_name"
    missing+=("$command_name")
  fi
done

if [ "${#missing[@]}" -gt 0 ]; then
  echo
  echo "Missing required Fedora platform tools:"
  printf '  - %s\n' "${missing[@]}"
  exit 1
fi

pipx ensurepath >/dev/null 2>&1 || true

echo
make --version | head -1
shellcheck --version | head -2
yamllint --version
pre-commit --version
ansible --version | head -1
ansible-lint --version | head -1
pipx --version
direnv version
tmux -V

echo "== Fedora platform tools complete =="
