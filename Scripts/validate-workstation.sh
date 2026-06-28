#!/usr/bin/env bash
set -euo pipefail

echo "== Workstation Validation =="
echo

check_cmd() {
  local cmd="$1"
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "✅ $cmd: $(command -v "$cmd")"
  else
    echo "❌ $cmd: missing"
  fi
}

echo "== System =="
hostnamectl --static
echo

echo "== Core Commands =="
for cmd in git gh docker kubectl helm k9s code alacritty starship eza batcat rg fdfind fzf zoxide fastfetch task tofu sops age; do
  check_cmd "$cmd"
done
echo

echo "== Docker =="
docker version --format 'Client: {{.Client.Version}} | Server: {{.Server.Version}}'
docker compose version
echo

echo "== Kubernetes Tools =="
kubectl version --client=true
helm version --short
k9s version | head -n 8
echo

echo "== Git =="
git config --global user.name
git config --global user.email
git config --global --get init.defaultbranch
echo

echo "== GitHub SSH =="
ssh -T git@github.com || true
echo

echo "== Dev Layout =="
test -d "$HOME/Dev/GitHub/ced4568/platform-engineering-workstation" && echo "✅ workstation repo exists"
test -d "$HOME/Dev/GitHub/ced4568/maintis-app" && echo "✅ maintis-app exists"
test -d "$HOME/Dev/GitHub/ced4568/Synthos-Systems-AI-OS-Internal" && echo "✅ Synthos AI OS exists"
echo

echo "== Complete =="
