#!/usr/bin/env bash

function __vimr_impl() {
    root=$1
    cd "$root" || return
    nvim -c "lua require('telescope').extensions.recent_files.pick({only_cwd=true})"
    cd - || return
}

function vimr() {
    git_root=$(git rev-parse --show-toplevel 2> /dev/null)
    if [ -z "$git_root" ]; then
        git_root=$(pwd);
    fi;
    [[ $# -eq 0 ]] && root="$git_root" || root=$1
    __vimr_impl "$root"
}

bindkey -s "^S" 'vimr^M'
