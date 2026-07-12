#!/usr/bin/env bash
set -euo pipefail

echo "== Installing base workstation packages =="

sudo nala update

sudo nala install -y \
  git curl wget vim htop btop tree zip unzip 7zip jq yq \
  ripgrep fd-find bat eza fzf zoxide ncdu fastfetch lm-sensors inxi \
  gh docker.io docker-compose-v2 make shellcheck yamllint pre-commit \
  ansible ansible-lint pipx direnv tmux

mkdir -p "$HOME/.local/bin"

echo "== Base packages complete =="
