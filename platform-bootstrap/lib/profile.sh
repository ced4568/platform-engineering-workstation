#!/usr/bin/env bash

PROFILE_DIR="$ROOT_DIR/profiles"

list_profiles() {
    local profile
    local found=false

    log_info "Available profiles"

    for profile in "$PROFILE_DIR"/*.conf; do
        [[ -f "$profile" ]] || continue

        found=true

        unset PROFILE_NAME PROFILE_DESCRIPTION PROFILE_MODULES
        source "$profile"

        printf "  %-24s %s\n" \
            "${PROFILE_NAME:-unknown}" \
            "${PROFILE_DESCRIPTION:-No description}"
    done

    if [[ "$found" == false ]]; then
        log_warn "No profiles found in $PROFILE_DIR"
    fi
}

load_profile() {
    local profile_name="${1:-}"
    local profile_file

    if [[ -z "$profile_name" ]]; then
        log_error "A profile name is required."
        return 1
    fi

    profile_file="$PROFILE_DIR/${profile_name}.conf"

    if [[ ! -f "$profile_file" ]]; then
        log_error "Profile not found: $profile_name"
        return 1
    fi

    unset PROFILE_NAME PROFILE_DESCRIPTION PROFILE_MODULES
    source "$profile_file"

    log_success "Loaded profile: $PROFILE_NAME"
    log_info "$PROFILE_DESCRIPTION"
}

apply_profile() {
    local profile_name="${1:-}"

    load_profile "$profile_name" || return 1

    log_info "Modules assigned to this profile:"

    local module
    for module in "${PROFILE_MODULES[@]}"; do
        printf "  - %s\n" "$module"
    done
}
