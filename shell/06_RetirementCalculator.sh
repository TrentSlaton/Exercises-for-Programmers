#!/usr/bin/env sh

currentYear=$(date +%Y)
numRegex='^[0-9]+$'

printf "What is your current age? "
read -r age

while [ -z "$age" ] || ! echo "$age" | grep -Eq "$numRegex"; do
	clear
	echo "What is your current age?"
	printf "You must enter a whole number: "
	read -r age
done

printf "What age would you like to retire? "
read -r retireAge

while [ -z "$retireAge" ] || ! echo "$retireAge" | grep -Eq "$numRegex"; do
	clear
	echo "What age would you like to retire?"
	printf "You must enter a whole number: "
	read -r retireAge
done

yearsLeft=$(echo "$retireAge - $age" | bc)
retireYear=$(echo "$currentYear + $yearsLeft" | bc)

if [ "$retireYear" -lt "$currentYear" ]; then
	echo "You can retire already!"
else
echo "You have $yearsLeft years left until you can retire."
echo "It is $currentYear, so you can retire in $retireYear."
fi
