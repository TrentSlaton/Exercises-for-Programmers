#!/usr/bin/env sh

numRegex='^[0-9]*\.?[0-9]+$'

printf "What is the first number? "
read -r firstNum


while [ -z "$firstNum" ] || ! echo "$firstNum" | grep -Eq "$numRegex"; do
	clear
	echo "What is the first number?"
	printf "You must enter a number (integer or float): "
	read -r firstNum
done

printf "What is the second number? "
read -r secondNum

while [ -z "$secondNum" ] || ! echo "$secondNum" | grep -Eq "$numRegex"; do
	clear
	echo "What is the second number?"
	printf "You must enter a number (integer or float): "
	read -r secondNum
done

plus=$(echo "$firstNum + $secondNum" | bc)
minus=$(echo "$firstNum - $secondNum" | bc)
times=$(echo "$firstNum * $secondNum" | bc)
div=$(echo "scale=4; $firstNum / $secondNum" | bc)

echo "$firstNum + $secondNum = $plus"
echo "$firstNum - $secondNum = $minus"
echo "$firstNum * $secondNum = $times"
echo "$firstNum / $secondNum = $div"
