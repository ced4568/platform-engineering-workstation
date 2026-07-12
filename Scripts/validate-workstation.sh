#!/usr/bin/env bash
set -euo pipefail

echo "== Workstation Validation =="
echo

failures=0

check_cmd() {
  local cmd="$1"

  if command -v "$cmd" >/dev/null 2>&1; then
    echo "✅ $cmd: $(command -v "$cmd")"
  else
    echo "❌ $cmd: missing"
    failures=$((failures + 1))
  fi
}

check_alternative() {
  local label="$1"
  shift

  local cmd
  for cmd in "$@"; do
    if command -v "$cmd" >/dev/null 2>&1; then
      echo "✅ $label: $(command -v "$cmd") [$cmd]"
      return 0
    fi
  done

  echo "❌ $label: missing (accepted: $*)"
  failures=$((failures + 1))
}

echo "== System =="

if [ -r /etc/os-release ]; then
  . /etc/os-release
  echo "${PRETTY_NAME:-Unknown Linux}"
fi

hostnamectl --static 2>/dev/null || hostname
echo

echo "== Core Commands =="

for cmd in \
  git gh docker kubectl helm k9s code alacritty starship \
  eza rg fzf zoxide fastfetch task tofu sops age
do
  check_cmd "$cmd"
done

check_alternative "bat" bat batcat
check_alternative "fd" fd fdfind

echo

echo "== Docker =="

if command -v docker >/dev/null 2>&1; then
  if docker info >/dev/null 2>&1; then
    docker version --format 'Client: {{.Client.Version}} | Server: {{.Server.Version}}'
    docker compose version
  else
    echo "❌ Docker CLI exists, but the daemon is unavailable or permission is denied."
    echo "   Log out and back in if Docker group membership was just added."
    failures=$((failures + 1))
  fi
fi

echo

echo "== Kubernetes Tools =="

if command -v kubectl >/dev/null 2>&1; then
  kubectl version --client=true
fi

if command -v helm >/dev/null 2>&1; then
  helm version --short
fi

if command -v k9s >/dev/null 2>&1; then
  k9s version | head -n 8
fi

echo

echo "== Git =="

git_name="$(git config --global user.name || true)"
git_email="$(git config --global user.email || true)"
git_branch="$(git config --global --get init.defaultbranch || true)"

if [ -n "$git_name" ]; then
  echo "✅ Git name: $git_name"
else
  echo "❌ Git user.name is not configured"
  failures=$((failures + 1))
fi

if [ -n "$git_email" ]; then
  echo "✅ Git email: $git_email"
else
  echo "❌ Git user.email is not configured"
  failures=$((failures + 1))
fi

if [ "$git_branch" = "main" ]; then
  echo "✅ Default branch: main"
else
  echo "❌ Git default branch is not main"
  failures=$((failures + 1))
fi

echo

echo "== GitHub SSH =="

if ssh -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
  echo "✅ GitHub SSH authentication succeeded"
else
  echo "⚠️  GitHub SSH authentication did not succeed."
  echo "   Configure a key and run: ssh -T git@github.com"
fi

echo

echo "== Dev Layout =="

check_directory() {
  local label="$1"
  local directory="$2"

  if [ -d "$directory" ]; then
    echo "✅ $label exists"
  else
    echo "⚠️  $label missing: $directory"
  fi
}

check_directory \
  "workstation repo" \
  "$HOME/Dev/GitHub/ced4568/platform-engineering-workstation"

check_directory \
  "maintis-app" \
  "$HOME/Dev/GitHub/ced4568/maintis-app"

check_directory \
  "Synthos AI OS" \
  "$HOME/Dev/GitHub/ced4568/Synthos-Systems-AI-OS-Internal"

echo

if [ "$failures" -gt 0 ]; then
  echo "== Validation Failed: $failures required check(s) failed =="
  exit 1
fi

echo "== Validation Complete =="
