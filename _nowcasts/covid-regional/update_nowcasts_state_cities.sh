#!/bin/bash
STATE=$1
N_CORES=$2
STATE_LOWER=`echo $STATE | tr '[:upper:]' '[:lower:]'`
RESULTS_DIR="brazil/cities-${STATE_LOWER}"

if [ -z "$1" ]
  then
    echo "Missing arguments. Usage: ./update_nowcasts_state_cities.sh <state-code>"
    exit 1
fi

## Update shared delay
#Rscript update_delay.R

## Load shared delay from github
Rscript load_delay.R

Rscript brazil/update_nowcasts_state_cities.R $STATE $RESULTS_DIR $N_CORES

errors=$(./move_regions_with_errors.sh $RESULTS_DIR)

echo $errors

#if [[ $errors ]]; then
    Rscript brazil/update_regional_summary.R $RESULTS_DIR
#fi

Rscript brazil/export_csv_cases.R $RESULTS_DIR
