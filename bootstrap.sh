#!/usr/bin/env bash
set -euo pipefail

echo "========================================"
echo " Platform Engineering Workstation Setup "
echo "========================================"
echo

echo "[1/5] Installing packages..."
./Bootstrap/packages.sh

echo
echo "[2/5] Dotfiles..."
# ./Bootstrap/dotfiles.sh

echo
echo "[3/5] VS Code..."
# ./Bootstrap/vscode.sh

echo
echo "[4/5] Docker..."
# ./Bootstrap/docker.sh

echo
echo "[5/5] Validation..."
./Scripts/validate-workstation.sh

echo
echo "Bootstrap complete."
