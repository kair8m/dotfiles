#!/usr/bin/env bash

export FZF_PREVIEW_PREVIEW_BAT_THEME="Dracula"
export FZF_DEFAULT_COMMAND="fd -H --type f"
export FZF_CTRL_T_COMMAND="fd -H --type f"
export FZF_ALT_C_COMMAND="fd -H --type f"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PYTHONSTARTUP=${HOME}/.pythonrc
export GEM_HOME="$HOME/.gems"
export RIM_HOME="$HOME/.rim"
