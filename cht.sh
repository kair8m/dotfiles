#!/usr/bin/env bash

function chtsh() {
    languages=$(echo "golang lua cpp typescript js python nodejs rust" | tr ' ' '\n')
    core_utils=$(echo "xargs find fd mv sed awk" | tr ' ' '\n')
    selected=$(printf "%s\n%s" "$languages" "$core_utils" | fzf)
    if [ -z "$selected" ]; then
        echo "Aborted"
        return
    fi
    vared -p "Enter query: " -c query
    green="\033[0;32m"
    nocolor="\033[0m"
    echo -e "$green $query $nocolor"
    if printf '%s' "$languages" | grep -qs "$selected"; then
        curl cht.sh/"$selected"/"$( echo "$query" | tr ' ' '+' )"
    else
        curl cht.sh/"$selected"~"$query"
    fi
}
