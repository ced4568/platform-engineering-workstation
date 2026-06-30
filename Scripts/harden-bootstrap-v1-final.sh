#!/usr/bin/env bash
set -euo pipefail

echo "== Hardening final Bootstrap V1 scripts =="

cat > Bootstrap/packages.sh <<'SCRIPT'
#!/usr/bin/env bash
set -euo pipefail

echo "== Installing base workstation packages =="

sudo nala update

sudo nala install -y \
  git curl wget vim htop btop tree zip unzip 7zip jq yq \
  ripgrep fd-find bat eza fzf zoxide ncdu fastfetch lm-sensors inxi \
  gh docker.io docker-compose-v2 make shellcheck yamllint pre-commit \
  ansible ansible-lint pipx direnv tmux

mkdir -p "$HOME/.local/bin"

echo "== Base packages complete =="
SCRIPT

cat > Bootstrap/ssh.sh <<'SCRIPT'
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
SCRIPT

cat > Bootstrap/fonts.sh <<'SCRIPT'
#!/usr/bin/env bash
set -euo pipefail

echo "== Installing JetBrains Mono Nerd Font =="

FONT_DIR="$HOME/.local/share/fonts"
TMP_DIR="/tmp/jetbrainsmono-nerdfont"

mkdir -p "$FONT_DIR"

if fc-list | grep -qi "JetBrainsMono Nerd Font"; then
  echo "JetBrains Mono Nerd Font already installed."
else
  rm -rf "$TMP_DIR"
  mkdir -p "$TMP_DIR"

  curl -L --fail -o "$TMP_DIR/JetBrainsMono.zip" \
    https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

  unzip -q "$TMP_DIR/JetBrainsMono.zip" -d "$TMP_DIR/JetBrainsMono"
  cp "$TMP_DIR/JetBrainsMono"/*.ttf "$FONT_DIR/"
  fc-cache -f "$FONT_DIR"
fi

fc-list | grep -i "JetBrainsMono Nerd Font" | head -3 || true
echo "== Fonts complete =="
SCRIPT

cat > Bootstrap/gnome.sh <<'SCRIPT'
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
SCRIPT

cat > Bootstrap/vscode-extensions.sh <<'SCRIPT'
#!/usr/bin/env bash
set -euo pipefail

FILE="$HOME/Dev/GitHub/ced4568/platform-engineering-workstation/Dotfiles/vscode/extensions.txt"

echo "== Installing VS Code Extensions =="

if ! command -v code >/dev/null 2>&1; then
  echo "VS Code CLI not found. Skipping extensions."
  exit 0
fi

if [ ! -f "$FILE" ]; then
  echo "No extensions file found at $FILE"
  exit 0
fi

while read -r EXT; do
  [ -z "$EXT" ] && continue

  if code --list-extensions | grep -qx "$EXT"; then
    echo "Already installed: $EXT"
  else
    echo "Installing: $EXT"
    code --install-extension "$EXT" --force
  fi
done < "$FILE"

echo "== VS Code extensions complete =="
SCRIPT

cat > Bootstrap/vscode.sh <<'SCRIPT'
#!/usr/bin/env bash
set -euo pipefail

echo "== Configuring VS Code =="

if ! command -v code >/dev/null 2>&1; then
  echo "VS Code CLI not found. Install VS Code first."
  exit 0
fi

"$HOME/Dev/GitHub/ced4568/platform-engineering-workstation/Bootstrap/vscode-extensions.sh"

echo "== VS Code complete =="
SCRIPT

chmod +x \
  Bootstrap/packages.sh \
  Bootstrap/ssh.sh \
  Bootstrap/fonts.sh \
  Bootstrap/gnome.sh \
  Bootstrap/vscode.sh \
  Bootstrap/vscode-extensions.sh

echo "== Final Bootstrap V1 hardening complete =="
