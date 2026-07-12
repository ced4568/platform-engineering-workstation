#!/usr/bin/env bash
set -euo pipefail

echo "== Kubernetes Tooling =="

if ! command -v kubectl >/dev/null 2>&1; then
  sudo snap install kubectl --classic
fi

if ! command -v helm >/dev/null 2>&1; then
  sudo snap install helm --classic
fi

if ! command -v k9s >/dev/null 2>&1; then
  mkdir -p "$HOME/.local/bin"
  curl -Lo /tmp/k9s.tar.gz https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_amd64.tar.gz
  tar -xzf /tmp/k9s.tar.gz -C /tmp k9s
  install -m 755 /tmp/k9s "$HOME/.local/bin/k9s"
fi

kubectl version --client
helm version --short
k9s version | head -8

echo "== Kubernetes tooling complete =="
