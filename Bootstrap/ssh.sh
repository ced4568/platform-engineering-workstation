#!/usr/bin/env bash
set -euo pipefail

echo "== Configuring SSH =="

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

CONFIG="$HOME/.ssh/config"

touch "$CONFIG"
chmod 600 "$CONFIG"

grep -q "Host github.com" "$CONFIG" || cat >> "$CONFIG" <<'SSHCFG'

# GitHub
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
    IdentitiesOnly yes

# SynthOS Dedicated
Host synthos01
    HostName 148.251.90.246
    User ced4568

# SynthOS VPS
Host synthos02
    HostName 104.225.218.142
    User ced4568
SSHCFG

echo "== SSH config complete =="
