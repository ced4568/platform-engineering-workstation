#!/usr/bin/env bash
set -euo pipefail

echo "== Installing Fedora Infrastructure Tools =="

mkdir -p "$HOME/.local/bin"

install_opentofu() {
  if command -v tofu >/dev/null 2>&1; then
    echo "OpenTofu already installed."
    return
  fi

  local installer="/tmp/install-opentofu.sh"

  curl --proto '=https' --tlsv1.2 -fsSL \
    https://get.opentofu.org/install-opentofu.sh \
    -o "$installer"

  chmod +x "$installer"
  "$installer" --install-method rpm
  rm -f "$installer"
}

install_task() {
  if command -v task >/dev/null 2>&1; then
    echo "Task already installed."
    return
  fi

  sh -c "$(curl --location --fail --silent --show-error \
    https://taskfile.dev/install.sh)" \
    -- -d -b "$HOME/.local/bin"
}

install_sops() {
  if command -v sops >/dev/null 2>&1; then
    echo "SOPS already installed."
    return
  fi

  local version="3.13.2"
  local architecture
  local asset

  architecture="$(uname -m)"

  case "$architecture" in
    x86_64)
      asset="sops-v${version}.linux.amd64"
      ;;

    aarch64|arm64)
      asset="sops-v${version}.linux.arm64"
      ;;

    *)
      echo "Unsupported SOPS architecture: $architecture"
      exit 1
      ;;
  esac

  curl -fsSL \
    "https://github.com/getsops/sops/releases/download/v${version}/${asset}" \
    -o "$HOME/.local/bin/sops"

  chmod +x "$HOME/.local/bin/sops"
}

install_opentofu
install_task
install_sops

echo
echo "Versions:"
tofu version | head -1
task --version
sops --version 2>/dev/null | head -1
age --version

echo "== Fedora infrastructure tools complete =="
