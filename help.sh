#!/usr/bin/env bash

help() {
    bathelp="bat --plain --language=help"
    "$@" --help 2>&1 | "$bathelp"
}
