"use strict";

const charMap = new Map();
const input = document.getElementById("input");
const output = document.getElementById("output");
const count = document.getElementById("count");
const clear = document.getElementById("clear");

input.addEventListener("input", processText);
clear.addEventListener("click", clearAll);

function processText(event) {
    charMap.clear();

    if (input.value.length == 0) {
        clearUI();
        return;
    }

    processInput();
    updateUI();
}

function clearUI() {
    output.innerHTML = "";
    count.innerHTML = "";
}

function processInput() {
    for (let i = 0; i < input.value.length; i++) {
        let char = input.value[i];

        if (char == " ") {
            char = "space";
        } else if (char == "\n") {
            char = "newline";
        } else if (char == "\t") {
            char = "tab";
        }

        if (charMap.has(char)) {
            charMap.set(char, charMap.get(char) + 1);
        } else {
            charMap.set(char, 1);
        }
    }
}

function updateUI() {
    if (input.value.length > 100) {
        output.innerHTML = `I ain't printing all that... but it has ${input.value.length} characters.`;
    } else {
        output.innerHTML = `${input.value} has ${input.value.length} characters`;
    }

    let sortedEntries = Array.from(charMap).sort((a, b) => a[0].localeCompare(b[0]));
    count.innerHTML = "";
    for (let [key, value] of sortedEntries) {
        count.innerHTML += `${key}: ${value}<br>`;
    }

    output.style.display = "block";
    count.style.display = "block";
}

function clearAll() {
    charMap.clear();
    input.value = "";
    clearUI();
}
