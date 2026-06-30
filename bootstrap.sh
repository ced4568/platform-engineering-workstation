#!/usr/bin/env bash
set -euo pipefail

echo "========================================"
echo " Platform Engineering Workstation Setup "
echo "========================================"
echo

run_step() {
  local name="$1"
  local script="$2"

  echo
  echo "----------------------------------------"
  echo "$name"
  echo "----------------------------------------"
  "$script"
}

run_step "Base Packages" ./Bootstrap/packages.sh
run_step "Git" ./Bootstrap/git.sh
run_step "SSH" ./Bootstrap/ssh.sh
run_step "GitHub CLI" ./Bootstrap/github.sh
run_step "Fonts" ./Bootstrap/fonts.sh
run_step "Bash" ./Bootstrap/bash.sh
run_step "Dotfiles" ./Bootstrap/dotfiles.sh
run_step "direnv" ./Bootstrap/direnv.sh
run_step "tmux" ./Bootstrap/tmux.sh
run_step "Docker" ./Bootstrap/docker.sh
run_step "Kubernetes" ./Bootstrap/kubernetes.sh
run_step "Infrastructure Tools" ./Bootstrap/infrastructure.sh
run_step "Platform Tools" ./Bootstrap/platform-tools.sh
run_step "VS Code" ./Bootstrap/vscode.sh
run_step "GNOME" ./Bootstrap/gnome.sh

echo
echo "========================================"
echo " Bootstrap complete. Run: task final "
echo "========================================"
