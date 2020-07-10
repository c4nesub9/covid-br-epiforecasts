RESULTS_DIR=${1?param missing - results dir.}

sh move_regions_with_errors.sh $RESULTS_DIR

Rscript brazil/update_regional_summary.R $RESULTS_DIR
