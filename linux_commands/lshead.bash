#! /bin/bash

#List the few lines of every file in a directory specified by the argument
#Allows the option to list the first n lines or the last n lines of a file
#It is ignoring the directories
#lshead [-head/-tail] [n lines] [directory location]

args1=$1
args2=$2
args3=$3

if [ $args1 == "-head" ] 
then
   head -n $args2 ~/$args3/* 2>/dev/null
elif [ $args1 == "-tail" ]
then
   tail -n $args2 ~/$args3/* 2>/dev/null
else
   head ~/$args1/* 2>/dev/null
fi
