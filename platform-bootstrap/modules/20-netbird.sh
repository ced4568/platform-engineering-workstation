#!/usr/bin/env bash

netbird_validate() {
    log_info "Checking NetBird..."

    if ! command_exists netbird; then
        log_warn "NetBird CLI not installed"
        return 0
    fi

    log_success "NetBird CLI installed"
    netbird version 2>/dev/null || true

    if systemctl is-enabled netbird >/dev/null 2>&1; then
        log_success "NetBird service enabled"
    else
        log_warn "NetBird service disabled"
    fi

    if systemctl is-active netbird >/dev/null 2>&1; then
        log_success "NetBird service running"
    else
        log_warn "NetBird service stopped"
    fi

    if netbird status >/dev/null 2>&1; then
        log_success "NetBird peer connected"
    else
        log_warn "NetBird peer not connected"
    fi
}

netbird_install() {
    log_warn "NetBird installation has not been implemented yet."
}

netbird_repair() {
    log_warn "NetBird repair has not been implemented yet."
}

netbird_report() {
    if command_exists netbird; then
        netbird version 2>/dev/null || true
        netbird status 2>/dev/null || true
    else
        echo "NetBird: Not installed"
    fi
}
