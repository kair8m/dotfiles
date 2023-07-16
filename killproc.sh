#!/usr/bin/env bash

function killproc() {
    (
        date
        ps -ef
    ) |
    fzf --bind='ctrl-r:reload(date; ps -ef)' \
        --header=$'Press CTRL-R to reload\n\n' --header-lines=2 \
        --preview='echo {}' --preview-window=down,3,wrap \
        --layout=reverse --height=80% | awk '{print $2}' | xargs kill -9
}

bindkey -s "^P" 'killproc^M'
