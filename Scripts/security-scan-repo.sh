#!/usr/bin/env bash
set -euo pipefail

echo "== Simple repo secret scan =="

patterns='(PRIVATE KEY|BEGIN RSA|BEGIN OPENSSH|password=|token=|api[_-]?key|secret=|gho_|github_pat_|AKIA|\.env)'

if grep -RInE "$patterns" . \
  --exclude-dir=.git \
  --exclude-dir=Backups \
  --exclude=security-scan-repo.sh; then
  echo
  echo "Potential secret found. Review before pushing."
  exit 1
else
  echo "No obvious secrets found."
fi
