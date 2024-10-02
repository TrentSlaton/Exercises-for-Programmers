#!/usr/bin/env sh

numRegex='^[0-9]*\.?[0-9]+$'
paintArea=350

echo "Calculate the number of gallons of paint you need to paint the ceiling!"

printf "What is the length of the ceiling in feet? "
read -r length

while [ -z "$length" ] || ! echo "$length" | grep -Eq "$numRegex"; do
	clear
	echo "Calculate the number of gallons of paint you need to paint the ceiling!"
	printf "What is the length of the ceiling in feet? "
	read -r length
done

echo $length
