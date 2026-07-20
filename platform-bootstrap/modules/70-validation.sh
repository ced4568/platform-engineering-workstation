#!/usr/bin/env bash

validate_system() {
    local profile_name="${1:-fedora-workstation}"

    log_info "Running Platform Bootstrap Validation"

    load_profile "$profile_name" || return 1
    run_profile_action validate
}
