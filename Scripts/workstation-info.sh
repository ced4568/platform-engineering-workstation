#!/usr/bin/env bash
set -euo pipefail

clear

echo "======================================="
echo " Platform Engineering Workstation"
echo "======================================="
echo

fastfetch

echo
echo "========== Git =========="
git --version
gh --version | head -n 1

echo
echo "========== Docker =========="
docker --version
docker compose version

echo
echo "========== Kubernetes =========="
kubectl version --client --short 2>/dev/null || kubectl version --client
helm version --short
k9s version | head -n 8

echo
echo "========== Disk =========="
df -h /

echo
echo "========== Memory =========="
free -h

echo
echo "========== Uptime =========="
uptime
