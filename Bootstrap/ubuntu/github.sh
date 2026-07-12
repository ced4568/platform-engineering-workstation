#!/usr/bin/env bash
set -euo pipefail

echo "== GitHub CLI =="

if ! command -v gh >/dev/null 2>&1; then
  sudo nala install -y gh
fi

if gh auth status >/dev/null 2>&1; then
  echo "GitHub CLI already authenticated."
else
  echo "GitHub CLI is not authenticated."
  echo "Run: gh auth login"
  exit 1
fi

gh auth status

echo
echo "GitHub SSH check:"
ssh -T git@github.com || true

echo
echo "Installed repositories:"
gh repo list ced4568 --limit 10

echo
echo "GitHub bootstrap complete."
