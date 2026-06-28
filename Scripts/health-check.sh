#!/usr/bin/env bash
set -euo pipefail

echo "========== Platform Engineering Workstation =========="
echo

task security:scan
echo

task validate
echo

task repos:duplicates
echo

task ssh:check
echo

task repos:status
echo

echo "✓ Workstation healthy."
