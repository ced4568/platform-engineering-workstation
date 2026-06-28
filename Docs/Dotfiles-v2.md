# Dotfiles v2 Plan

Goal: make the repository the source of truth for workstation configuration.

## Rules

- Keep secrets out of Git.
- Keep SSH private keys, known_hosts, kubeconfigs, tokens, and env files out of Git.
- Keep ADRs/SOPs private in Obsidian/Docmost.
- Public repo stores safe configs, scripts, and high-level usage docs only.

## Dotfiles to manage

- Bash
- Alacritty
- Starship
- Git
- tmux
- VS Code extensions
- VS Code settings, after review
- SSH config, only host aliases with no secrets

## Alacritty note

Only use the tested mouse-safe Alacritty config.
Do not re-add mouse/selection settings until tested one at a time.
