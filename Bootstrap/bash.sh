#!/usr/bin/env bash
set -euo pipefail

echo "== Configuring Bash =="

BASHRC="$HOME/.bashrc"
MARKER="# --- Platform Engineering Workstation ---"

if grep -q "$MARKER" "$BASHRC"; then
  echo "Existing workstation Bash block found. Skipping append."
else
  cat >> "$BASHRC" <<'BASH_EOF'

# --- Platform Engineering Workstation ---
export HISTSIZE=50000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
shopt -s checkwinsize

# Better defaults
alias ll='eza -lah --icons --group-directories-first'
alias la='eza -la --icons --group-directories-first'
alias ls='eza --icons --group-directories-first'
alias cat='batcat'
alias grep='grep --color=auto'
alias fd='fdfind'
alias ports='ss -tulpen'
alias myip='hostname -I'
alias update='sudo nala update && sudo nala upgrade'
alias please='sudo'

# Navigation
alias dev='cd ~/Dev'
alias ghdev='cd ~/Dev/GitHub'
alias ws='cd ~/Dev/GitHub/ced4568/platform-engineering-workstation'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate --all'

# zoxide
eval "$(zoxide init bash)"

# Starship Prompt
eval "$(starship init bash)"
BASH_EOF
fi

echo "== Bash config complete =="
