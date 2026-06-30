#!/usr/bin/env bash
set -euo pipefail

echo "== Installing Infrastructure Tools =="

mkdir -p "$HOME/.local/bin"

if ! command -v tofu >/dev/null 2>&1; then
  cd /tmp
  curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh
  chmod +x install-opentofu.sh
  sudo ./install-opentofu.sh --install-method deb
fi

if ! command -v age >/dev/null 2>&1; then
  sudo nala install -y age
fi

if ! command -v sops >/dev/null 2>&1; then
  "$HOME/Dev/GitHub/ced4568/platform-engineering-workstation/Scripts/fix-sops.sh"
fi

if ! command -v task >/dev/null 2>&1; then
  sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b "$HOME/.local/bin"
fi

echo
echo "Versions:"
tofu version | head -1
age --version
sops --version 2>/dev/null | head -1
task --version

echo "== Infrastructure tools complete =="
