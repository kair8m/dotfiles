#!/bin/bash

function cdfzf() {
    proj_root=$(git rev-parse --show-toplevel 2> /dev/null)
    if [ -z "$proj_root" ]; then
        proj_root=$(pwd);
    fi;
    cd "$proj_root" || return
    dir=$(fd --type=d | fzf --preview "tree {} -L 1 -C" --bind "ctrl-j:down,ctrl-k:up,ctrl-h:preview-up,ctrl-l:preview-down,ctrl-q:abort")
    if [ -z "$dir" ]; then
        cd - || return
        return
    fi;
    cd "$dir" || exit
}
