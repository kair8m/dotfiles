#!/usr/bin/env bash

function md-preview {
    pandoc "$1" | lynx -stdin
}
