#!/usr/bin/env bash

docker_validate() {

    log_info "Checking Docker..."

    if command_exists docker; then
        log_success "Docker CLI installed"

        docker --version
    else
        log_warn "Docker CLI not installed"
    fi

    if command_exists docker; then

        if systemctl is-enabled docker >/dev/null 2>&1; then
            log_success "Docker service enabled"
        else
            log_warn "Docker service disabled"
        fi

        if systemctl is-active docker >/dev/null 2>&1; then
            log_success "Docker service running"
        else
            log_warn "Docker service stopped"
        fi

    fi
}

docker_install() {

    log_warn "Docker installation has not been implemented yet."

}

docker_repair() {

    log_warn "Docker repair has not been implemented yet."

}

docker_report() {

    echo "Docker"

    if command_exists docker; then
        docker --version
    else
        echo "Not Installed"
    fi

}
