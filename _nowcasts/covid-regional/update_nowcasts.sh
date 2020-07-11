#!/bin/bash

RESULTS_DIR="brazil/regional"

## Update shared delay
#Rscript update_delay.R

## Load shared delay from github
Rscript load_delay.R

Rscript brazil/update_nowcasts.R $RESULTS_DIR

errors=$(./move_regions_with_errors.sh $RESULTS_DIR)

echo $errors

if [[ $errors ]]; then
    Rscript brazil/update_regional_summary.R $RESULTS_DIR
fi
