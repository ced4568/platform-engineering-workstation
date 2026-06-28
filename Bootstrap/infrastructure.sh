#!/usr/bin/env bash
set -euo pipefail

echo "== Infrastructure Tools =="

tofu version
task --version
age --version
sops --version

echo
echo "Infrastructure bootstrap complete."
