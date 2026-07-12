#!/usr/bin/env bash
set -euo pipefail

BOOTSTRAP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMMON_DIR="$(cd "$BOOTSTRAP_DIR/../common" && pwd)"

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
run_step "Git" "$COMMON_DIR/git.sh"
run_step "SSH" "$COMMON_DIR/ssh.sh"
run_step "GitHub CLI" "$COMMON_DIR/github.sh"
run_step "Fonts" "$COMMON_DIR/fonts.sh"
run_step "Bash" "$COMMON_DIR/bash.sh"
run_step "Dotfiles" "$COMMON_DIR/dotfiles.sh"
run_step "direnv" "$BOOTSTRAP_DIR/direnv.sh"
run_step "tmux" "$BOOTSTRAP_DIR/tmux.sh"
run_step "Docker" "$BOOTSTRAP_DIR/docker.sh"
run_step "Kubernetes" "$BOOTSTRAP_DIR/kubernetes.sh"
run_step "Infrastructure Tools" "$BOOTSTRAP_DIR/infrastructure.sh"
run_step "Platform Tools" "$BOOTSTRAP_DIR/platform-tools.sh"
run_step "VS Code" "$COMMON_DIR/vscode.sh"
run_step "GNOME" "$COMMON_DIR/gnome.sh"
