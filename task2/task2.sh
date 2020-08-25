#!/bin/bash


echo "Enter file path:"
read FILE

echo "Enter Row#"
read ROW


echo "Enter Column#"
read COL

awk 'BEGIN{FS=","} NR=='$ROW' {print $'$COL'}' $FILE



