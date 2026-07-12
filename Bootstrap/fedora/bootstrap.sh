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

  if [ ! -x "$script" ]; then
    echo "Missing or non-executable bootstrap module:"
    echo "$script"
    exit 1
  fi

  "$script"
}

echo "========================================"
echo " Fedora Platform Engineering Workstation"
echo "========================================"

run_step "Fedora Base Packages" "$BOOTSTRAP_DIR/packages.sh"
run_step "Fedora Desktop Tools" "$BOOTSTRAP_DIR/desktop-tools.sh"

run_step "Git Configuration" "$COMMON_DIR/git.sh"
run_step "SSH Configuration" "$COMMON_DIR/ssh.sh"
run_step "GitHub CLI" "$COMMON_DIR/github.sh"
run_step "Fonts" "$COMMON_DIR/fonts.sh"
run_step "Bash Configuration" "$COMMON_DIR/bash.sh"
run_step "Dotfiles" "$COMMON_DIR/dotfiles.sh"

run_step "Fedora Platform Tools" "$BOOTSTRAP_DIR/platform-tools.sh"
run_step "Docker" "$BOOTSTRAP_DIR/docker.sh"
run_step "Kubernetes Tools" "$BOOTSTRAP_DIR/kubernetes.sh"
run_step "Infrastructure Tools" "$BOOTSTRAP_DIR/infrastructure.sh"

run_step "VS Code Configuration" "$COMMON_DIR/vscode.sh"
run_step "GNOME Configuration" "$COMMON_DIR/gnome.sh"

echo
echo "========================================"
echo " Fedora bootstrap complete"
echo "========================================"
echo
echo "Log out and back in if Docker group membership changed."
echo "Then run:"
echo
echo "  task validate"
echo "  task versions"
echo "  task health"
echo "  task final"
