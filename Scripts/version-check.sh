#!/usr/bin/env bash
set -euo pipefail

echo "== Version Check =="

show_version() {
  local label="$1"
  shift

  if command -v "$1" >/dev/null 2>&1; then
    echo
    echo "[$label]"
    "$@" || true
  else
    echo
    echo "[$label]"
    echo "Not installed"
  fi
}

if [ -r /etc/os-release ]; then
  . /etc/os-release
  echo "OS: ${PRETTY_NAME:-Unknown Linux}"
fi

show_version "Git" git --version
show_version "GitHub CLI" gh --version
show_version "Docker" docker --version

if command -v docker >/dev/null 2>&1; then
  echo
  echo "[Docker Compose]"
  docker compose version 2>/dev/null || echo "Unavailable"
fi

show_version "kubectl" kubectl version --client
show_version "Helm" helm version --short
show_version "k9s" k9s version
show_version "OpenTofu" tofu version
show_version "SOPS" sops --version
show_version "age" age --version
show_version "Task" task --version
show_version "VS Code" code --version
show_version "Alacritty" alacritty --version
show_version "Starship" starship --version

echo
echo "[bat]"

if command -v bat >/dev/null 2>&1; then
  bat --version
elif command -v batcat >/dev/null 2>&1; then
  batcat --version
else
  echo "Not installed"
fi

echo
echo "[fd]"

if command -v fd >/dev/null 2>&1; then
  fd --version
elif command -v fdfind >/dev/null 2>&1; then
  fdfind --version
else
  echo "Not installed"
fi
