#!/usr/bin/env bash

function vimfzf() {
    proj_root=$(git rev-parse --show-toplevel 2> /dev/null)
    if [ -z "$proj_root" ]; then
        proj_root=$(pwd);
    fi;
    cd "$proj_root" || return
    file=$(fzf --preview "bat --color=always --style=numbers {-1}")
    if [ -z "$file" ]; then
        cd - || return
        return
    fi;
    nvim "$file"
    cd - || return
}