#!/bin/bash
podman run -it --rm \
    --name claude --hostname claude \
    -v .:/root/workspace \
    -v ./.claude.json:/root/.claude.json \
    -v ./.claude:/root/.claude \
    -v ./.cache/claude:/root/.cache/claude \
    localhost/claude:latest

# function that can add to .bashrc
claudocker() {
    local config="${XDG_CONFIG_HOME:-${HOME}/.config}/claude"
    local cache="${XDG_CACHE_HOME:-${HOME}/.cache}/claude"
    local state="${XDG_STATE_HOME:-${HOME}/.local/state}/.claude.json"
    [ -d "$config" ] || mkdir -p "$config"
    [ -d "$cache" ] || mkdir -p "$cache"
    [ -f "$state" ] || touch "$state"

    podman run -it --rm \
        --name claude --hostname claude \
        -v .:/root/workspace \
        -v "$state":/root/.claude.json \
        -v "$config":/root/.claude \
        -v "$cache":/root/.cache/claude \
        localhost/claude:latest
}
