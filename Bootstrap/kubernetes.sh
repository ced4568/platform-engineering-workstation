#!/usr/bin/env bash
set -euo pipefail

echo "== Kubernetes Tooling =="

command -v kubectl >/dev/null || sudo snap install kubectl --classic
command -v helm >/dev/null || sudo snap install helm --classic

if ! command -v k9s >/dev/null; then
    curl -sS https://webinstall.dev/k9s | bash
fi

echo
kubectl version --client
helm version --short
k9s version | head -8

echo
echo "== Kubernetes complete =="
