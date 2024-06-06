#!/usr/bin/env bash

function __vims_impl() {
    root=$1
    cd "$root" || return
    nvim -c "Telescope live_grep_args"
    cd - || return
}

function vims() {
    git_root=$(git rev-parse --show-toplevel 2>/dev/null)
    if [ -z "$git_root" ]; then
        git_root=$(pwd)
    fi
    [[ $# -eq 0 ]] && root="$git_root" || root=$1
    __vims_impl "$root"
}

bindkey -s "^F" 'vims^M'
