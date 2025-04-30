#!/bin/bash
# author: jarry
# description: uninstall docker
# date: 2025-04-30

docker_packages=("docker-ce" "docker-buildx-plugin" "docker-compose-plugin" "docker-ce-cli" "containerd.io")
for package in "${docker_packages[@]}"; do
    sudo dpkg -P ${package}
    if sudo dpkg -s ${package} >/dev/null 2>&1; then
        echo "${package} uninstalled failed"
    else
        echo "${package} installed successfully"
    fi
done