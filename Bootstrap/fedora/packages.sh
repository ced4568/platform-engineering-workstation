#!/usr/bin/env bash
set -euo pipefail

echo "== Installing Fedora base packages =="

sudo dnf upgrade --refresh -y

sudo dnf install -y \
  git \
  curl \
  wget \
  vim-enhanced \
  htop \
  btop \
  tree \
  zip \
  unzip \
  p7zip \
  p7zip-plugins \
  jq \
  yq \
  ripgrep \
  fd-find \
  bat \
  eza \
  fzf \
  zoxide \
  ncdu \
  fastfetch \
  lm_sensors \
  inxi \
  gh \
  make \
  ShellCheck \
  yamllint \
  pre-commit \
  ansible \
  ansible-lint \
  pipx \
  direnv \
  tmux \
  age

mkdir -p "$HOME/.local/bin"

echo "== Fedora base packages complete =="
