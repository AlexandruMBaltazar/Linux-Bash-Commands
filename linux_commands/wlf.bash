#!/bin/bash
# This command finds the longest word and returns it and it's lengh
# Extra feature: Checks if a file exists

if [ -f $1 ] && [ $# -gt 0 ]
then
	for i in $(<$1)
	do
    		if (( ${#i} > ${#word} ))
    		then
        		length=${#i}
			word=$i
    		fi
	done
	printf 'The longest word is %s and its length is %d.\n' "$word" "$length"
else
	echo 'File does not exist'
fi









