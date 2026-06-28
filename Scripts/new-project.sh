#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
    echo "Usage:"
    echo "new-project <project-name>"
    exit 1
fi

PROJECT="$1"
BASE="$HOME/Dev/GitHub/ced4568/$PROJECT"

mkdir -p "$BASE"

cd "$BASE"

git init

cat > README.md <<README
# $PROJECT

Project description.

## Getting Started

TODO

## License

MIT
README

cat > .gitignore <<GIT
.env
node_modules/
dist/
build/
.DS_Store
GIT

echo "Project created at:"
echo "$BASE"
