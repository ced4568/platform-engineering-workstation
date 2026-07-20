#!/usr/bin/env bash

monitoring_validate() {
    log_info "Checking monitoring tools..."

    local tools=(
        curl
        jq
        htop
        btop
    )

    local tool

    for tool in "${tools[@]}"; do
        if command_exists "$tool"; then
            log_success "$tool installed"
        else
            log_warn "$tool missing"
        fi
    done
}

monitoring_install() {
    log_warn "Monitoring installation has not been implemented yet."
}

monitoring_repair() {
    log_warn "Monitoring repair has not been implemented yet."
}

monitoring_report() {
    local tools=(
        curl
        jq
        htop
        btop
    )

    local tool

    for tool in "${tools[@]}"; do
        if command_exists "$tool"; then
            printf '%s: installed\n' "$tool"
        else
            printf '%s: missing\n' "$tool"
        fi
    done
}
