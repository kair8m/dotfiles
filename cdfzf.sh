#!/bin/bash

function __cdfzf_impl() {
    root=$1
    cd "$root" || return
    preview_cmd=""
    if hash lsd 2>/dev/null; then
        preview_cmd="lsd -1a --group-directories-first --tree --depth 1 --color always --icon always --icon-theme fancy"
    else
        preview_cmd="tree -L 1 -C"
    fi
    dir=$(fd --type=d | fzf --preview "$preview_cmd {}" --bind "ctrl-j:down,ctrl-k:up,ctrl-h:preview-up,ctrl-l:preview-down,ctrl-q:abort")
    if [ -z "$dir" ]; then
        cd - || return
        return
    fi;
    cd "$dir" || exit
}

function cdfzf() {
    git_root=$(git rev-parse --show-toplevel 2> /dev/null)
    if [ -z "$git_root" ]; then
        git_root=$(pwd);
    fi;
    [[ $# -eq 0 ]] && root="$git_root" || root=$1
    __cdfzf_impl "$root"
}
