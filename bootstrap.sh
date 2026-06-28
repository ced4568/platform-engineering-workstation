#!/usr/bin/env bash
set -euo pipefail

echo "========================================"
echo " Platform Engineering Workstation Setup "
echo "========================================"

./Bootstrap/packages.sh
./Bootstrap/fonts.sh
./Bootstrap/git.sh
./Bootstrap/starship.sh
./Bootstrap/bash.sh
./Bootstrap/ssh.sh
./Bootstrap/alacritty.sh
./Bootstrap/tmux.sh
./Bootstrap/docker.sh
./Bootstrap/kubernetes.sh
./Bootstrap/github.sh
./Bootstrap/vscode.sh
./Bootstrap/gnome.sh
./Bootstrap/dotfiles.sh

./Scripts/validate-workstation.sh

echo
echo "Bootstrap complete."
