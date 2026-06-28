#!/usr/bin/env bash
set -euo pipefail

echo "== Network Check =="

echo
echo "DNS:"
resolvectl dns || true

echo
echo "GitHub DNS:"
getent hosts github.com || true
getent hosts api.github.com || true

echo
echo "Connectivity:"
ping -c 2 github.com || true

echo
echo "HTTPS:"
curl -I https://github.com --max-time 10 | head || true
