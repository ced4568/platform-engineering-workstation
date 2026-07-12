#!/usr/bin/env bash
set -euo pipefail

echo "== Installing Docker on Fedora =="

if ! command -v docker >/dev/null 2>&1; then
  sudo dnf -y install dnf-plugins-core

  sudo dnf config-manager addrepo \
    --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo

  sudo dnf install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin
fi

sudo systemctl enable --now docker

if ! id -nG "$USER" | grep -qw docker; then
  sudo usermod -aG docker "$USER"
  echo "Added $USER to docker group. Log out and back in before using Docker without sudo."
fi

docker --version
docker compose version

echo "== Docker complete =="
