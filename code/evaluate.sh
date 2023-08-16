#!/bin/bash

touch marksheet.csv
touch distribution.txt


for f in `find organised/ -name *.cpp`
    
    do
      directory=$(dirname $f)
      roll=$(basename $directory)
      cd organised/$roll
      g++ -o executable ../../$f 2>/dev/null |:
      cd ..
      cd ..
      score=0
      mkdir $directory/student_outputs
      for g in `find mock_grading/inputs/ -name *.in`
          do
            output=`basename $g | cut -d "." -f 1`
            timeout 5s ./$directory/executable <$g> ./$directory/student_outputs/$output.out 2>/dev/null|:
            if cmp -s "mock_grading/outputs/$output.out" "$directory/student_outputs/$output.out"; then
                ((score++))
            fi
       done
       
    
      echo "$roll,$score" >> marksheet.csv
      echo "$score" >> distribution.txt
      
    done

mv distribution.txt distribution_old.txt
mv marksheet.csv marksheet_old.csv

touch distribution.txt
touch marksheet.csv

sort -r distribution_old.txt>>distribution.txt
sort marksheet_old.csv>>marksheet.csv

rm marksheet_old.csv
rm distribution_old.txt             
