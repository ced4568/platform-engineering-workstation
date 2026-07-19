#!/usr/bin/env bash

MODULE_DIR="$ROOT_DIR/modules"

load_modules() {
    for module in "$MODULE_DIR"/*.sh; do
        [[ -f "$module" ]] && source "$module"
    done
}
