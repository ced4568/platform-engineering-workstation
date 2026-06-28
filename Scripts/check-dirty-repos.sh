#!/usr/bin/env bash
set -euo pipefail

BASE="$HOME/Dev/GitHub/ced4568"

echo "== Checking Git repositories for local changes =="

find "$BASE" -mindepth 1 -maxdepth 1 -type d | sort | while read -r repo; do
  if [ -d "$repo/.git" ]; then
    name="$(basename "$repo")"
    if [ -n "$(git -C "$repo" status --porcelain)" ]; then
      echo "⚠️  $name has local changes"
      git -C "$repo" status --short
      echo
    else
      echo "✅ $name clean"
    fi
  fi
done

echo "== Dirty repo check complete =="
