#!/usr/bin/env bash
set -euo pipefail

echo "== Configuring Docker =="

if ! command -v docker >/dev/null 2>&1; then
  sudo nala install -y docker.io docker-compose-v2
fi

sudo systemctl enable docker
sudo systemctl start docker

if groups "$USER" | grep -q '\bdocker\b'; then
  echo "User already in docker group."
else
  sudo usermod -aG docker "$USER"
  echo "Added $USER to docker group. Reboot or log out/in required."
fi

docker --version
docker compose version

if docker info >/dev/null 2>&1; then
  echo "Docker daemon is reachable."
else
  echo "Docker installed, but current shell may not have docker group access yet."
fi

echo "== Docker config complete =="
