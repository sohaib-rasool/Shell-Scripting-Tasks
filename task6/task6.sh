#!/bin/bash


DIRECTORY=`dirname $0`

echo "Enter file path"
read FILE

#extracting numbers and storing-------------------
cut -d " " -f 4 $FILE > $DIRECTORY/num.txt


#sorting and storing-----------------------------
cat $DIRECTORY/num.txt | sort > $DIRECTORY/sort.txt


#Max--------------------------------------------

MAX=0

echo "MAX:"
while read -r line; do a=`echo $line|tr -d '\r'`; if [[ $a -gt $MAX ]] ;then MAX=$a;fi; done<$DIRECTORY/sort.txt; echo $MAX;

#MIN-------------------------------------------

MIN=99999
echo "MIN:"
while read -r line; do a=`echo $line|tr -d '\r'`; if [[ $a -lt $MIN ]] ;then MIN=$a;fi; done<$DIRECTORY/sort.txt; echo $MIN;



#SUM------------------------------------------


SUM=0
COUNT=0
echo "SUM:"

while read -r line
do 
	a=`echo $line|tr -d '\r'`
	SUM=`expr $SUM + $a`
	COUNT=`expr $COUNT + 1`
done < $DIRECTORY/sort.txt;
echo $SUM
echo "COUNT:"
echo $COUNT

#MEAN---------------------------------------

echo "MEAN:"

echo `expr $SUM / $COUNT`

#MEDIAN-----------------------------------
echo "MEDIAN:"
MEDIAN=0
TMP=`expr $COUNT % 2`
if [[ $TMP -eq 0 ]]
	then

		A=`awk ' NR=='$(expr $COUNT / 2)' {print $1}' $DIRECTORY/sort.txt`
a=`echo $A|tr -d '\r'`
		B=`awk ' NR=='$(echo "($COUNT/2)+1" | bc)' {print $1}' $DIRECTORY/sort.txt`
b=`echo $B|tr -d '\r'`
		MEDIAN=`echo "($b+$a)/2" | bc -l` 
#	else
		MEDIAN=`awk ' NR=='$(echo "($COUNT/2)+1" | bc)' {print $1}' $DIRECTORY/sort.txt`

fi

echo $MEDIAN
