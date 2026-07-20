#!/usr/bin/env bash

MODULE_DIR="$ROOT_DIR/modules"

load_modules() {
    local module

    for module in "$MODULE_DIR"/*.sh; do
        [[ -f "$module" ]] || continue
        source "$module"
    done
}

run_profile_action() {
    local action="${1:-}"
    local module
    local function_name
    local failures=0

    if [[ -z "$action" ]]; then
        log_error "A module action is required."
        return 1
    fi

    if ! declare -p PROFILE_MODULES >/dev/null 2>&1; then
        log_error "No profile is currently loaded."
        return 1
    fi

    for module in "${PROFILE_MODULES[@]}"; do
        function_name="${module}_${action}"

        echo
        log_info "Running ${function_name}"

        if declare -F "$function_name" >/dev/null 2>&1; then
            if ! "$function_name"; then
                log_error "${function_name} failed"
                ((failures++))
            fi
        else
            log_warn "Module action not implemented: ${function_name}"
        fi
    done

    echo

    if (( failures > 0 )); then
        log_error "$failures module action(s) failed."
        return 1
    fi

    log_success "Profile action completed: $action"
}
