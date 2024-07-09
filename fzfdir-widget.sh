__fzfdir_impl() {
    setopt localoptions pipefail no_aliases 2>/dev/null
    local root
    root=$1
    local preview_cmd
    if hash lsd 2>/dev/null; then
        preview_cmd="lsd -1a --group-directories-first --tree --depth 1 --color always --icon always --icon-theme fancy"
    else
        preview_cmd="tree -L 1 -C"
    fi
    fd . "$root" -t d | fzf --preview "$preview_cmd {}" --bind "ctrl-j:down,ctrl-k:up,ctrl-h:preview-up,ctrl-l:preview-down,ctrl-q:abort"
    local ret=$?
    echo
    return $ret
}

fzfdir-widget() {
    git_root=$(git rev-parse --show-toplevel 2>/dev/null)
    if [ -z "$git_root" ]; then
        git_root=$(pwd)
    fi
    [[ $# -eq 0 ]] && root="$git_root" || root=$1
    LBUFFER="${LBUFFER}$(__fzfdir_impl "$root")"
    local ret=$?
    zle reset-prompt
    return $ret
}

zle -N fzfdir-widget
bindkey -M emacs '^O' fzfdir-widget
bindkey -M vicmd '^O' fzfdir-widget
bindkey -M viins '^O' fzfdir-widget
