#!/usr/bin/env bash
set -euo pipefail

echo "== Checking duplicate project directories =="

if [ -d "$HOME/Dev/GitHub/maintis-app" ] && [ -d "$HOME/Dev/GitHub/ced4568/maintis-app" ]; then
  echo "Duplicate found: maintis-app exists in both ~/Dev/GitHub and ~/Dev/GitHub/ced4568"
fi

if [ -d "$HOME/Dev/GitHub/Synthos-Systems-AI-OS-Internal" ] && [ -d "$HOME/Dev/GitHub/ced4568/Synthos-Systems-AI-OS-Internal" ]; then
  echo "Duplicate found: Synthos-Systems-AI-OS-Internal exists in both ~/Dev/GitHub and ~/Dev/GitHub/ced4568"
fi

echo "== Duplicate check complete =="
