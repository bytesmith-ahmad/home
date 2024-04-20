#!/bin/bash

goto() {
    local dir
    dir=$(task _get "$1.dir")
    if [ -n "$dir" ]; then
        cd "$dir" || echo "Failed to change directory to $dir"
        tree
    else
        echo "Directory not found for task $1"
    fi
}

goto $1
