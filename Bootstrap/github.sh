#!/usr/bin/env bash
set -euo pipefail

echo "== GitHub =="

if gh auth status >/dev/null 2>&1; then
    echo "Already authenticated."
else
    gh auth login
fi

gh auth status

echo
echo "== GitHub complete =="
