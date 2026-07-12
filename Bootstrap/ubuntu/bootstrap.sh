#!/usr/bin/env bash
set -euo pipefail

BOOTSTRAP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

run_step() {
  local name="$1"
  local script="$2"

  echo
  echo "----------------------------------------"
  echo "$name"
  echo "----------------------------------------"

  "$script"
}

run_step "Base Packages" "$BOOTSTRAP_DIR/packages.sh"
run_step "Git" "$BOOTSTRAP_DIR/git.sh"
run_step "SSH" "$BOOTSTRAP_DIR/ssh.sh"
run_step "GitHub CLI" "$BOOTSTRAP_DIR/github.sh"
run_step "Fonts" "$BOOTSTRAP_DIR/fonts.sh"
run_step "Bash" "$BOOTSTRAP_DIR/bash.sh"
run_step "Dotfiles" "$BOOTSTRAP_DIR/dotfiles.sh"
run_step "direnv" "$BOOTSTRAP_DIR/direnv.sh"
run_step "tmux" "$BOOTSTRAP_DIR/tmux.sh"
run_step "Docker" "$BOOTSTRAP_DIR/docker.sh"
run_step "Kubernetes" "$BOOTSTRAP_DIR/kubernetes.sh"
run_step "Infrastructure Tools" "$BOOTSTRAP_DIR/infrastructure.sh"
run_step "Platform Tools" "$BOOTSTRAP_DIR/platform-tools.sh"
run_step "VS Code" "$BOOTSTRAP_DIR/vscode.sh"
run_step "GNOME" "$BOOTSTRAP_DIR/gnome.sh"
