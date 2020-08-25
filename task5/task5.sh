#!/bin/bash



for i in `find . -name "*.log"`
do
	tmp=$(cat $i | grep -h "recon-all-run-time-hours" | awk  '{print $3}' | grep -o '^[0-9]*\.[0-9][0-9]')
echo $tmp

if (( $(bc <<< "9.5>$tmp") > 0 )); then echo $i; fi

done
