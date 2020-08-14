#!/bin/bash

RESULTS_DIR=${1%/} # remove slash if present

for DIR in $RESULTS_DIR/*; do
    LATEST_DIR="$DIR/latest"
    if [ -d "$LATEST_DIR" ]; then
        PREVIOUS_DIR="$DIR/previous"
        echo "Moving last results to $PREVIOUS_DIR."
        rm -rf "$PREVIOUS_DIR" && mv "$LATEST_DIR" "$PREVIOUS_DIR"
    fi
done

