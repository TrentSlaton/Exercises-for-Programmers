#!/usr/bin/env sh

while true; do
	echo "What is the input string?"

	read -r str

	if [ -z "$str" ]; then
		clear
		echo "You must enter a word or sentence."
	else
		length=${#str}
		echo "$str has $length characters."
		break
	fi
done
