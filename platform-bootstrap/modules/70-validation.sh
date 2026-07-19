#!/usr/bin/env bash

validate_system() {

    log_info "Running Platform Bootstrap Validation"

    if command_exists docker; then
        log_success "Docker installed"
    else
        log_warn "Docker missing"
    fi

    if command_exists git; then
        log_success "Git installed"
    else
        log_warn "Git missing"
    fi

    if command_exists infisical; then
        log_success "Infisical installed"
    else
        log_warn "Infisical missing"
    fi

    if command_exists netbird; then
        log_success "NetBird installed"
    else
        log_warn "NetBird missing"
    fi
}
