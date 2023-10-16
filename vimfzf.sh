#!/usr/bin/env bash

function __vimfzf_impl() {
    root=$1
    cd "$root" || return
    file=$(fzf --preview "bat --color=always --style=numbers {-1}" --bind "ctrl-j:down,ctrl-d:page-down,ctrl-u:page-up,ctrl-k:up,ctrl-h:preview-up,ctrl-l:preview-down,ctrl-q:abort")
    if [ -z "$file" ]; then
        cd - || return
        return
    fi;
    nvim "$file"
    cd - || return
}

function vimfzf() {
    git_root=$(git rev-parse --show-toplevel 2> /dev/null)
    if [ -z "$git_root" ]; then
        git_root=$(pwd);
    fi;
    [[ $# -eq 0 ]] && root="$git_root" || root=$1
    __vimfzf_impl "$root"
}

bindkey -s "^E" 'vimfzf^M'
