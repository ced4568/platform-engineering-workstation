#!/usr/bin/env bash
set -euo pipefail

echo "== Installing base workstation packages =="

sudo nala update

sudo nala install -y \
  git \
  curl \
  wget \
  vim \
  htop \
  btop \
  tree \
  zip \
  unzip \
  7zip \
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
  lm-sensors \
  inxi \
  gh \
  docker.io \
  docker-compose-v2

echo "== Installing snap packages =="

sudo snap install kubectl --classic || true
sudo snap install helm --classic || true

echo "== Installing k9s =="

mkdir -p "$HOME/.local/bin"
curl -Lo /tmp/k9s.tar.gz https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_amd64.tar.gz
tar -xzf /tmp/k9s.tar.gz -C /tmp k9s
install -m 755 /tmp/k9s "$HOME/.local/bin/k9s"

echo "== Docker group =="
sudo usermod -aG docker "$USER"

echo "== Package install complete =="
echo "Log out/reboot for Docker group membership to apply."
