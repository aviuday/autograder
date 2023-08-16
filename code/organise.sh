#!/bin/sh
mkdir organised


FILE=mock_grading/"roll_list"

len=0

for f in $(cat $FILE)
    do
        mkdir organised/$f
        len=${#f}
    done


SUB='mock_grading/submissions'

for g in $(ls $SUB) 
    do
        curfile=$(basename $g)
        ROLL=$(echo $g | head -c $len)

        ln -s ../../mock_grading/submissions/$g organised/$ROLL/$g 
    done

exit 0

result = $(ls | egrep | $ )

#https://stackoverflow.com/questions/15596199/how-can-i-count-the-number-of-characters-in-a-bash-variable
