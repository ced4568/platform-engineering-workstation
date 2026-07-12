#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "========================================"
echo " Platform Engineering Workstation Setup "
echo "========================================"
echo

if [ ! -r /etc/os-release ]; then
  echo "Unable to detect the operating system."
  exit 1
fi

source /etc/os-release

case "${ID:-unknown}" in
  ubuntu)
    platform="ubuntu"
    ;;

  fedora)
    platform="fedora"
    ;;

  *)
    echo "Unsupported operating system: ${PRETTY_NAME:-${ID:-unknown}}"
    exit 1
    ;;
esac

echo "Detected: ${PRETTY_NAME:-$platform}"
echo "Bootstrap platform: $platform"

bootstrap_script="$REPO_ROOT/Bootstrap/$platform/bootstrap.sh"

if [ ! -x "$bootstrap_script" ]; then
  echo
  echo "Bootstrap support for $platform is not ready yet."
  echo "Expected executable: $bootstrap_script"
  exit 1
fi

"$bootstrap_script"

echo
echo "========================================"
echo " Bootstrap complete. Run: task final "
echo "========================================"
