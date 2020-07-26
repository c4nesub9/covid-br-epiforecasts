#!/bin/bash

## Run the world
Rscript update_nowcasts.R

Rscript ../../utils/export_csv_cases.R national 

## Run death Rts for the world
#Rscript update_deaths_nowcasts.R
