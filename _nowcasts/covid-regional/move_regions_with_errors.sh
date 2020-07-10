RESULTS_DIR=${1%/} # remove slash if present
ERROR_DIR=${RESULTS_DIR}-errors

for DIR in $RESULTS_DIR/*/; do
    if [ ! -d "$DIR/latest" ]; then
	[ -d $ERROR_DIR ] || mkdir $ERROR_DIR
        echo "Results not found for $DIR. Moving to $ERROR_DIR."
	mv "$DIR" $ERROR_DIR/
    fi
done

