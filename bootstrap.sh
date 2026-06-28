#!/usr/bin/env bash
set -euo pipefail

echo "========================================"
echo " Platform Engineering Workstation Setup "
echo "========================================"
echo

echo "[1/6] Installing packages..."
./Bootstrap/packages.sh

echo
echo "[2/6] Configuring Git..."
./Bootstrap/git.sh

echo
echo "[3/6] Configuring Bash..."
./Bootstrap/bash.sh

echo
echo "[4/6] Configuring SSH..."
./Bootstrap/ssh.sh

echo
echo "[5/6] Configuring Docker..."
./Bootstrap/docker.sh

echo
echo "[6/6] Validation..."
./Scripts/validate-workstation.sh

echo
echo "Bootstrap complete."
