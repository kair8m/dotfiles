#!/usr/bin/env bash

export EDITOR=nvim
alias py=python
alias sc="source $HOME/.zshrc"
alias top=vtop
alias vim=nvim
alias edit="$EDITOR"
alias untar="tar -xvf"
alias tarpack="tar -czvf"
alias cat=bat
alias lg=lazygit
alias gw="git worktree"
alias gs="git status"
alias gc="git checkout"
alias gs="git status"
alias gl="git log"
if hash lsd 2>/dev/null; then
    alias ls="lsd --group-directories-first"
    alias ll="lsd -l --group-directories-first"
    alias la="lsd -lA --group-directories-first"
    alias l="lsd -la --group-directories-first"
    alias lt="lsd -la --group-directories-first --tree"
fi
