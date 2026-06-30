#!/usr/bin/env bash
set -euo pipefail

echo "== Configuring SSH =="

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

CONFIG="$HOME/.ssh/config"
touch "$CONFIG"
chmod 600 "$CONFIG"

add_host_block() {
  local host="$1"
  local block="$2"

  if grep -q "^Host $host$" "$CONFIG"; then
    echo "Host $host already exists. Skipping."
  else
    printf "\n%s\n" "$block" >> "$CONFIG"
  fi
}

add_host_block "github.com" "# GitHub
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
    IdentitiesOnly yes"

add_host_block "synthos01" "# SynthOS Dedicated
Host synthos01
    HostName 148.251.90.246
    User ced4568"

add_host_block "synthos02" "# SynthOS VPS
Host synthos02
    HostName 104.225.218.142
    User ced4568"

ssh -G github.com >/dev/null

echo "== SSH config complete =="
