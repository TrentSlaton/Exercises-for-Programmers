#!/usr/bin/env sh


echo "Mad Libs!"
echo ""
printf "Enter a noun: "

read -r noun

while [ -z "$noun" ]; do
	clear
	echo "Mad Libs!"
	echo ""
printf "You must enter a noun: "
	read -r noun
done

clear

echo "Mad Libs!"
echo ""
echo "noun: $noun"
printf "Enter a verb: "
read -r verb

while [ -z "$verb" ]; do
	clear
	echo "Mad Libs!"
	echo ""
	echo "noun: $noun"
printf "You must enter a verb: "
	read -r verb
done

clear

echo "Mad Libs!"
echo ""
echo "noun: $noun"
echo "verb: $verb"
printf "Enter an adjective: "
read -r adjective

while [ -z "$adjective" ]; do
	clear
	echo "Mad Libs!"
	echo ""
	echo "noun: $noun"
	echo "verb: $verb"
printf "You must enter an adjective: "
	read -r adjective
done

clear

echo "Mad Libs!"
echo ""
echo "noun: $noun"
echo "verb: $verb"
echo "adjective: $adjective"
printf "Enter an adverb: "
read -r adverb

while [ -z "$adverb" ]; do
	clear
	echo "Mad Libs!"
	echo ""
	echo "noun: $noun"
	echo "verb: $verb"
	echo "adjective: $adjective"
printf "You must enter an adverb: "
	read -r adverb
done

clear

echo "Mad Libs!"
echo ""
echo "noun: $noun"
echo "verb: $verb"
echo "adverb: $adverb"

echo "Do you $verb your $adjective $noun $adverb? That's hilarious!"
