#!/bin/bash

main() {
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    examplesDir="examples"
    for example in $examplesDir/*; do
	if [[ $example != *"~"* ]]; then
	    echo Testing \'$example\'
	    ./myparser $example >/dev/null 2>&1
	    if [[ $? != 0 ]]; then
		errCode=$?
		echo Failed test \'$example\'
		exit $errCode
	    fi
	fi
    done
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo All tests succeeded! Well Done!
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"    
}

main $@
