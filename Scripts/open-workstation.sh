#!/usr/bin/env bash
set -euo pipefail

ROOT="$HOME/Dev/GitHub/ced4568"

echo
echo "1) Platform Engineering Workstation"
echo "2) Ceds Homelab"
echo "3) Maintis"
echo "4) Synthos AI OS"
echo "5) Ced Portfolio"
echo

read -rp "Select: " choice

case "$choice" in
1) code "$ROOT/platform-engineering-workstation" ;;
2) code "$ROOT/ceds-homelab" ;;
3) code "$ROOT/maintis-app" ;;
4) code "$ROOT/Synthos-Systems-AI-OS-Internal" ;;
5) code "$ROOT/ced-portfolio" ;;
*) echo "Invalid option" ;;
esac
