#!/bin/bash

#This command is used to take sets of strings and calculate how many alphabetic, digits and non alphanumeric characters are in each string 

declare -a myarray='()'

digits_total=0

alpha_total=0

non_alpha_total=0

digits=0

alpha=0

non_alpha=0

bool="true"

counter=0

if [ -z "$1" ] #This if statement checks if the user passed an argument or not (if not then display a message)
then
  echo "masher.bash requiers a single argument of alphanumeric charcters."
fi

echo "Entering a # anywhere in the string will terminate the script"


while [ "$bool" == "true" ] #The while loop will terminate when the # symbol is met and bool would be set to false
do

  read -p "Enter string: " user_input #Takes the string from the user and stores it in the user_input argument

  myarray=( $(echo $user_input | grep -o .) ) #Splits the string taken form the user for example Hello would become H e l l o and stores each individual character in the array

  aLen=${#myarray[@]} #Gets the length of the array

  for (( i=0; i<${aLen}; i++ )) #The for loop is going to loop through each character from the array
  do

    if [ "${myarray[$i]}" == "#" ] #Checks if the character is # and if it is the script will terminate
    then
      bool="false"
      break

    elif grep -q "[A-Z]" <<< "${myarray[$i]}" #Checks if the character is found in the set [A-Z] and if it is the alpha and alpha_total variables will increment by 1
    then
      (( ++alpha_total ))
      (( ++alpha ))

    elif grep -q "[a-z]" <<< "${myarray[$i]}" #Checks if the character is found in the set [a-z] and if it is the alpha and alpha_total variables will increment by 1
    then
      (( ++alpha_total ))
      (( ++alpha ))

    elif grep -q "[0-9]" <<< "${myarray[$i]}" #Checks if the character is found in the set [0-9] and if it is the digits and digits_total variables will increment by 1
    then
      (( ++digits_total ))
      (( ++digits ))

    else #If it is not the # symbol or a letter or a number then it must be an non alphanumeric character
      (( ++non_alpha_total ))
      (( ++non_alpha ))

    fi

  done

  (( ++counter ))

  myarray='()'

  echo "For the $counter string of characters: "
  echo "======================="
  echo "Number of digits in string: $digits"
  echo "Number of letters in the string: $alpha"
  echo "Number of non alpha numberic characters in the string: $non_alpha"
  echo "======================="

  digits=0
  alpha=0
  non_alpha=0

done

echo "Total number of digits in string: $digits_total"
echo "Total number of letters in the string: $alpha_total"
echo "Total number of non alpha numberic characters in the string: $non_alpha_total"
