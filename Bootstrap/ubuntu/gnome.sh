#!/usr/bin/env bash
set -euo pipefail

echo "== Applying GNOME settings =="

if ! command -v gsettings >/dev/null 2>&1; then
  echo "gsettings not found. Skipping GNOME settings."
  exit 0
fi

gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.peripherals.mouse accel-profile flat
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

echo "== GNOME settings complete =="
