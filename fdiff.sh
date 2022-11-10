#!/usr/bin/env bash

function fdiff {
    preview="git diff -- {-1} | delta --file-style=omit --width=${FZF_PREVIEW_COLUMNS:-$COLUMNS}"
    proj_root=$(git rev-parse --show-toplevel 2> /dev/null)
    if [ -z "$proj_root" ]; then
        echo "Not a git repository"
        return
    fi;
    cd "$proj_root" || return
    git diff "$@" --name-only | fzf -m --ansi --preview "$preview"
    cd - || return
}
