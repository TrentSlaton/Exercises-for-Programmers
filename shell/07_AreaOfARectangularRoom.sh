#!/usr/bin/env sh

# TODO: update numRegex to accept floats, prompt for
#for option to enter either feet or meters
#and update conversion accordingly, pretty
#print

numRegex='^[0-9]*\.?[0-9]+$'

echo "Calculate the area of a rectangular room!"

printf "What is the length of the room in feet? "
read -r length

while [ -z "$length" ] || ! echo "$length" | grep -Eq "$numRegex"; do
	clear
	echo "Calculate the area of a rectangular room!"
	printf "What is the length of the room in feet? "
	read -r length
done

printf "What is the width of the room in feet? "
read -r width

while [ -z "$width" ] || ! echo "$width" | grep -Eq "$numRegex"; do
	clear
	echo "Calculate the area of a rectangular room!"
	echo "length: $length"
	printf "What is the width of the room in feet? "
	read -r width
done

CONV="0.09290304"

feet=$(echo "$length * $width @ 3" | bc)
meters=$(echo "($feet * $CONV) @ 3" | bc)


echo "The area is"
echo "$feet square feet."
echo "$meters square meters."
