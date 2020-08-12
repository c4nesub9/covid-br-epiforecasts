#!/bin/bash

RESULTS_DIR="brazil/cidades-rna"

## Update shared delay
#Rscript update_delay.R

## Load shared delay from github
Rscript load_delay.R

Rscript brazil/update_nowcasts_cities.R $RESULTS_DIR brazil/data/cidades_rna.csv 1 1 1

errors=$(./move_regions_with_errors.sh $RESULTS_DIR)

echo $errors

if [[ $errors ]]; then
    Rscript brazil/update_regional_summary.R $RESULTS_DIR
fi

Rscript brazil/export_csv_cases.R $RESULTS_DIR
