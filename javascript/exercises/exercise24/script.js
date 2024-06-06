"use strict";

// get UI elements
const firstWord = document.getElementById("firstWord");
const secondWord = document.getElementById("secondWord");
const check = document.getElementById("check");
const result = document.getElementById("result");

// check isAnagram
const isAnagram = (firstWord, secondWord) => {
    if (firstWord.length != secondWord.length) {
        return false;
    }

    const firstDict = {};
    const secondDict = {};

    for (const char of firstWord) {
        if (firstDict[char]) {
            firstDict[char] += 1;
        } else {
            firstDict[char] = 1;
        }
    }

    for (const char of secondWord) {
        if (secondDict[char]) {
            secondDict[char] += 1;
        } else {
            secondDict[char] = 1;
        }
    }

    for (const key in firstDict) {
        if (firstDict[key] != secondDict[key]) {
            return false;
        }
    }

    return true;
};

// add event listeners and update UI elements
check.addEventListener("click", () => {
    if (isAnagram(firstWord.value, secondWord.value)) {
        result.innerHTML = `${firstWord.value} and ${secondWord.value} ARE anagrams!`;
    } else {
        result.innerHTML = `${firstWord.value} and ${secondWord.value} are NOT anagrams!`;
    }
});
