#!/bin/bash


echo "Please enter directory to search for and take backup of all .c files: "

read DIR
#cd $DIR




#ls *.c -LR 

#Checking for backup directory--------------------------
[ -d /home/backup ] || ( echo "No Backup exists, creating a new backup file.." &&  sudo mkdir /home/backup )





#Backup-----------------------------
MOD=0


for i in `find $DIR -name "*.c"`





do
TMP=0	
#echo "i $i"
	for j in `find /home/backup -name "*.c"`
	do
	#echo "j $j"
		if [[ "`basename $i`" == "`basename $j`" ]]
		then
		#	echo "$i $j"
			TMP=1
			`cmp -s $i $j` || { sudo cp $i /home/backup && echo "$i was modified and backup is now updated."  && MOD=1; }
			break			
		fi
#echo "loop 22: $MOD"
	done

	if [[ $TMP -eq 0 ]]
		then

			echo "$i is a new file and its backup is created now"
			sudo cp $i /home/backup
	fi
#echo "Loop 1: $MOD"
#sudo cp $i /home/backup

done

if [[ $MOD -eq 0 ]]
then
#	echo "if: $MOD"
	echo "No new modifications since last backup"
fi















