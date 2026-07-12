#!/usr/bin/env bash
set -euo pipefail

echo "== Installing Platform Engineering tools =="

sudo nala install -y \
  make \
  shellcheck \
  yamllint \
  pre-commit \
  ansible \
  ansible-lint \
  pipx

make --version | head -1
shellcheck --version | head -2
yamllint --version
pre-commit --version
ansible --version | head -1
ansible-lint --version | head -1
pipx --version

echo "== Platform tools complete =="
