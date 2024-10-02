#!/usr/bin/env sh

# TODO: clean up output, functionalize, handle negative numbers

numRegex='^[0-9]+$'

printf "How many people? "
read -r people

while [ -z people ] || ! echo "$people" | grep -Eq "$numRegex"; do
	clear
	printf "How many people? "
	read -r people
done

printf "How many pizzas? "
read -r pizzas

while [ -z pizzas ] || ! echo "$pizzas" | grep -Eq "$numRegex"; do
	clear
	printf "People: "
	echo $people
	printf "How many pizzas? "
	read -r pizzas
done

printf "How many slices per pizza? "
read -r slices

while [ -z slices ] || ! echo "$slices" | grep -Eq "$numRegex"; do
	clear
	printf "People: "
	echo $people
	printf "Pizzas: "
	echo $pizzas
	printf "How many slices per pizza? "
	read -r slices
done

totalSlices=$(echo "$pizzas * $slices" | bc)
slicesEach=$(echo "$totalSlices / $people" | bc)
leftoverSlices=$(echo "$totalSlices % $people" | bc)

echo "$people people with $pizzas pizzas, $slices slices per pizza."
echo "Each person gets $slicesEach slices of pizza."
echo "There are $leftoverSlices left over slices."
