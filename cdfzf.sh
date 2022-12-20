#!/bin/bash

function cdfzf() {
    proj_root=$(git rev-parse --show-toplevel 2> /dev/null)
    if [ -z "$proj_root" ]; then
        proj_root=$(pwd);
    fi;
    cd "$proj_root" || return
    file=$(fd --type=d -print | fzf --preview "tree {} -L 1 -C" --bind "ctrl-j:down,ctrl-k:up,ctrl-h:preview-up,ctrl-l:preview-down,ctrl-q:abort")
    if [ -z "$file" ]; then
        cd - || return
        return
    fi;
    nvim "$file"
    cd - || return
}
