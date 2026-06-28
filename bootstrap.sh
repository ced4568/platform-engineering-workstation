#!/usr/bin/env bash
set -euo pipefail

echo "========================================"
echo " Platform Engineering Workstation Setup "
echo "========================================"

./Bootstrap/packages.sh
./Bootstrap/git.sh
./Bootstrap/bash.sh
./Bootstrap/ssh.sh
./Bootstrap/docker.sh
./Bootstrap/kubernetes.sh
./Bootstrap/github.sh

./Scripts/validate-workstation.sh

echo
echo "Bootstrap complete."
