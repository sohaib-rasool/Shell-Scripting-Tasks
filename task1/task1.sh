#!/bin/sh



echo   "please enter search combination:"

read SEARCH

echo  "please enter directory to search:"
read DIR
#cd DIR


DIRECTORY=`dirname $0`
grep -rn $SEARCH $DIR > $DIRECTORY/result.txt
cat $DIRECTORY/result.txt


