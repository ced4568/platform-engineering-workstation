#!/usr/bin/env bash
set -euo pipefail

echo "== GitHub CLI =="

if ! command -v gh >/dev/null; then
    echo "GitHub CLI not installed."
    exit 1
fi

gh auth status

echo
echo "Installed repositories:"
gh repo list ced4568 --limit 10

echo
echo "GitHub bootstrap complete."
