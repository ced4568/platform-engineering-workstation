#!/usr/bin/env bash
set -euo pipefail

echo "== Updating workstation =="

sudo nala update
sudo nala upgrade -y
sudo nala autoremove --purge -y
sudo nala clean

echo
echo "== Updating GitHub repos =="
"$HOME/Dev/GitHub/ced4568/platform-engineering-workstation/Scripts/sync-github-repos.sh"

echo
echo "== Validation =="
"$HOME/Dev/GitHub/ced4568/platform-engineering-workstation/Scripts/validate-workstation.sh"

echo
echo "== Workstation update complete =="
