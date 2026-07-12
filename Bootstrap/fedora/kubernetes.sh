#!/usr/bin/env bash
set -euo pipefail

echo "== Installing Kubernetes tools on Fedora =="

mkdir -p "$HOME/.local/bin"

if ! command -v kubectl >/dev/null 2>&1; then
  version="$(curl -fsSL https://dl.k8s.io/release/stable.txt)"
  curl -fsSLo /tmp/kubectl \
    "https://dl.k8s.io/release/${version}/bin/linux/amd64/kubectl"
  install -m 755 /tmp/kubectl "$HOME/.local/bin/kubectl"
fi

if ! command -v helm >/dev/null 2>&1; then
  curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 \
    | bash
fi

if ! command -v k9s >/dev/null 2>&1; then
  curl -fsSL \
    https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_amd64.tar.gz \
    -o /tmp/k9s.tar.gz
  tar -xzf /tmp/k9s.tar.gz -C /tmp k9s
  install -m 755 /tmp/k9s "$HOME/.local/bin/k9s"
fi

kubectl version --client
helm version --short
k9s version | head -8

echo "== Kubernetes tools complete =="
