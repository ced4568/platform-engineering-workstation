#!/usr/bin/env bash
set -euo pipefail

echo "== Hardening remaining Bootstrap scripts =="

cat > Bootstrap/platform-tools.sh <<'SCRIPT'
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
SCRIPT

cat > Bootstrap/tmux.sh <<'SCRIPT'
#!/usr/bin/env bash
set -euo pipefail

echo "== Configuring tmux =="

if ! command -v tmux >/dev/null 2>&1; then
  sudo nala install -y tmux
fi

cp "$HOME/Dev/GitHub/ced4568/platform-engineering-workstation/Dotfiles/tmux/tmux.conf" "$HOME/.tmux.conf"

tmux -V
echo "== tmux complete =="
SCRIPT

cat > Bootstrap/direnv.sh <<'SCRIPT'
#!/usr/bin/env bash
set -euo pipefail

echo "== Configuring direnv =="

if ! command -v direnv >/dev/null 2>&1; then
  sudo nala install -y direnv
fi

if ! grep -q "direnv hook bash" "$HOME/.bashrc"; then
  cat >> "$HOME/.bashrc" <<'BASH_EOF'

# direnv
eval "$(direnv hook bash)"
BASH_EOF
fi

direnv version
echo "== direnv complete =="
SCRIPT

chmod +x Bootstrap/platform-tools.sh Bootstrap/tmux.sh Bootstrap/direnv.sh

echo "== Done =="
