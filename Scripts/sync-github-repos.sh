#!/usr/bin/env bash
set -euo pipefail

BASE="$HOME/Dev/GitHub/ced4568"

mkdir -p "$BASE"
cd "$BASE"

echo "== Syncing GitHub repos for ced4568 =="

for repo in $(gh repo list ced4568 --limit 100 --json name --jq '.[].name'); do
  if [ -d "$repo/.git" ]; then
    echo "Updating $repo..."
    git -C "$repo" pull --ff-only || echo "Skipped $repo due to local changes or branch issue."
  elif [ -d "$repo" ]; then
    echo "Skipping $repo because directory exists but is not a git repo."
  else
    echo "Cloning $repo..."
    gh repo clone "ced4568/$repo"
  fi
done

echo "== Repo sync complete =="
