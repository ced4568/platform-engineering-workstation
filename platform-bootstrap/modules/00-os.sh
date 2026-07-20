#!/usr/bin/env bash

os_validate() {
    log_info "Checking operating system..."

    if [[ -r /etc/os-release ]]; then
        # shellcheck disable=SC1091
        source /etc/os-release

        log_success "Operating system detected: ${PRETTY_NAME:-unknown}"
        log_info "OS family: ${ID:-unknown}"
        log_info "Architecture: $(uname -m)"
        log_info "Kernel: $(uname -r)"
    else
        log_error "Unable to read /etc/os-release"
        return 1
    fi
}

os_install() {
    log_warn "OS installation is not applicable."
}

os_repair() {
    log_warn "OS repair has not been implemented yet."
}

os_report() {
    if [[ -r /etc/os-release ]]; then
        # shellcheck disable=SC1091
        source /etc/os-release
        printf 'Operating System: %s\n' "${PRETTY_NAME:-unknown}"
    else
        printf 'Operating System: unknown\n'
    fi

    printf 'Architecture: %s\n' "$(uname -m)"
    printf 'Kernel: %s\n' "$(uname -r)"
}
