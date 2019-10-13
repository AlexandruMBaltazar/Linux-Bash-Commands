#! /bin/bash

#This command counts how many times a specified letter is repeated in a text file

#frq.bash [file location] [letter]

if [ -f $1 ] && [ $2 > "0" ]
then

	declare -a myarray='()'

	myarray=($( < $1 )) #The contents of the text file are supplied into an array 

	myarray=( $(echo "${myarray[*]}" | grep -o .) ) #Each word is not splt into letters

	aLen=${#myarray[@]}

	count=0

	for (( i=0; i<${aLen}; i++ ))
	do
		if [ "${myarray[$i]}" == "$2" ]
		then
			(( ++count ))
		fi
	done

	echo "Letter $2 was repeated $count times"

else
	echo "Please input a correct file or a letter"
fi
