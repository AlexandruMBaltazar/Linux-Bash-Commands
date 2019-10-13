#! /bin/bash

#listaste --> lists the names of all the files in waste bin and their size in bytes

file_array=( $(ls -lB ~/.waste | awk '{print $5}') )
size_array=( $(ls -lB ~/.waste | awk '{print $9}') )

aLen=${#file_array[@]}

for (( i=0; i<${aLen}; i++ ))
do
  echo "File size: ${file_array[$i]} bytes  File name: ${size_array[$i]}"
done
 
