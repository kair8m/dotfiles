#!/usr/bin/env bash

export FZF_PREVIEW_PREVIEW_BAT_THEME="Dracula"
export FZF_DEFAULT_COMMAND="fd -H --type f"
export FZF_CTRL_T_COMMAND="fd -H --type f"
export FZF_ALT_C_COMMAND="fd -H --type f"
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PYTHONSTARTUP=${HOME}/.pythonrc
export GEM_HOME="$HOME/.gems"
export RIM_HOME="$HOME/.rim"
