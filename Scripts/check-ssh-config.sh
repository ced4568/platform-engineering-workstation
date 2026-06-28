#!/usr/bin/env bash
set -euo pipefail

FILE="Dotfiles/ssh/config"

echo "== SSH Config Safety Check =="

if [ ! -f "$FILE" ]; then
  echo "Missing $FILE"
  exit 1
fi

if grep -RInE "PRIVATE KEY|BEGIN OPENSSH|BEGIN RSA|password|token|secret" "$FILE"; then
  echo "Potential sensitive SSH config content found."
  exit 1
fi

echo "SSH config looks safe."
