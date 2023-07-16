#!/usr/bin/env bash

export FZF_PREVIEW_PREVIEW_BAT_THEME="Catpuccin-frappe"
export FZF_DEFAULT_COMMAND="fd -H --type f"
export FZF_CTRL_T_COMMAND="fd -H --type f"
export FZF_ALT_C_COMMAND="fd -H --type f"
export FZF_DEFAULT_OPTS=" \
--layout=reverse \
--height=90% \
--margin=1 \
--padding=1 \
--border \
--info=inline \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PYTHONSTARTUP=${HOME}/.pythonrc
export GEM_HOME="$HOME/.gems"
export RIM_HOME="$HOME/.rim"
