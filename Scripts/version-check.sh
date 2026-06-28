#!/usr/bin/env bash
set -euo pipefail

echo "== Version Check =="

git --version
gh --version | head -1
docker --version
docker compose version
kubectl version --client
helm version --short
k9s version | grep Version || true
tofu version | head -1
sops --version
age --version
task --version
code --version | head -1
alacritty --version
starship --version
