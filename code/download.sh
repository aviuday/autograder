#!/bin/bash

if [[ $# -ne 2 ]]; then 
    echo "Usage: bash download.sh <link to directory> <cut-dirs argument>"
    exit 1
fi

wget -r -np -nH --cut-dirs=$2 -R index.html,index.html.tmp $1 -q 

fol=$(basename $1)

mv $fol mock_grading

exit 0
