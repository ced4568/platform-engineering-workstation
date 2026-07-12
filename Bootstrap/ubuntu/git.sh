#!/usr/bin/env bash
set -euo pipefail

echo "== Configuring Git =="

git config --global user.name "ced4568"
git config --global user.email "chasedumphord@gmail.com"
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global push.default simple
git config --global core.editor "code --wait"

# Helpful aliases
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.cm commit
git config --global alias.lg "log --oneline --graph --decorate --all"

echo "== Git config complete =="
git config --global --list | grep -E "user.name|user.email|init.defaultbranch|pull.rebase|push.default|core.editor|alias."
