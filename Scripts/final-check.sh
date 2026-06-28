#!/usr/bin/env bash
set -euo pipefail

task health
task dotfiles:audit
task versions
git status
