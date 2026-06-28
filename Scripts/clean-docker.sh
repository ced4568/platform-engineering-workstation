#!/usr/bin/env bash
set -euo pipefail

echo "== Docker disk usage before cleanup =="
docker system df

echo
read -rp "Remove stopped containers, unused networks, dangling images, and build cache? [y/N] " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
  docker system prune -f
  docker builder prune -f
else
  echo "Skipped Docker cleanup."
fi

echo
echo "== Docker disk usage after cleanup =="
docker system df
