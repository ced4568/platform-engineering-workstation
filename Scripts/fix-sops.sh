#!/usr/bin/env bash
set -euo pipefail

echo "== Installing sops =="

mkdir -p "$HOME/.local/bin"

curl -L https://github.com/getsops/sops/releases/download/v3.10.2/sops-v3.10.2.linux.amd64 \
  -o "$HOME/.local/bin/sops"

chmod +x "$HOME/.local/bin/sops"

sops --version
