#!/usr/bin/env bash

export FZF_PREVIEW_PREVIEW_BAT_THEME="Catppuccin-frappe"
export FZF_DEFAULT_COMMAND="fd -H --type f"
export FZF_CTRL_T_COMMAND="fd -H --type f"
export FZF_ALT_C_COMMAND="fd -H --type f"
export FZF_DEFAULT_OPTS=" \
--layout=reverse \
--height=80% \
--info=inline \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
--bind 'ctrl-j:down,ctrl-d:page-down,ctrl-u:page-up,ctrl-k:up,ctrl-h:preview-up,ctrl-l:preview-down,ctrl-q:abort'"

export BAT_THEME="Catppuccin-frappe"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
export PYTHONSTARTUP=${HOME}/.pythonrc
export GEM_HOME="$HOME/.gems"
export RIM_HOME="$HOME/.rim"
