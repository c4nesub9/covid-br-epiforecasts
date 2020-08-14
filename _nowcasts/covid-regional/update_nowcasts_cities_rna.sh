#!/bin/bash

RESULTS_DIR="brazil/cidades-rna"
CSV_FILE="https://raw.githubusercontent.com/eduardocorrearaujo/Municipios_Weka/master/Cidades_DataMining.csv"
#CSV_FILE="brazil/data/cidades_rna.csv"

## Update shared delay
#Rscript update_delay.R

# Move latest results to "previous" dir
./clean_latest_results.sh $RESULTS_DIR

## Load shared delay from github
Rscript load_delay.R
Rscript brazil/update_nowcasts_cities.R $RESULTS_DIR $CSV_FILE 1 1

errors=$(./move_regions_with_errors.sh $RESULTS_DIR)

echo $errors

if [[ $errors ]]; then
    Rscript brazil/update_regional_summary.R $RESULTS_DIR
fi

Rscript brazil/export_csv_cases.R $RESULTS_DIR
