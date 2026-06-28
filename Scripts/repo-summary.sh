#!/usr/bin/env bash
set -euo pipefail

echo "== Workstation Repo Summary =="

echo
echo "Commits:"
git log --oneline -10

echo
echo "Files:"
find . -maxdepth 2 -type f \
  -not -path "./.git/*" \
  | sort

echo
echo "Tasks:"
task --list
