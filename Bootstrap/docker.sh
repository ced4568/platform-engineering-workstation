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

echo "== Docker config complete =="
