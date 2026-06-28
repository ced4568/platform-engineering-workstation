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

echo
echo "Versions:"
make --version | head -1
shellcheck --version | head -2
yamllint --version
pre-commit --version
ansible --version | head -1
ansible-lint --version | head -1
