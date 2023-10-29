"use strict";

const charMap = new Map();
const input = document.getElementById("input");
const output = document.getElementById("output");
const clear = document.getElementById("clear");
const chartContext = document.getElementById("chart");

let myChart;

input.addEventListener("input", processText);
clear.addEventListener("click", clearUI);

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
    input.value = "";
    myChart.destroy();
}

function processInput() {
    const inputText = Array.from(input.value);
    for (let i = 0; i < inputText.length; i++) {
        let char = inputText[i];
        // let char = input.value[i];

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
    const labels = sortedEntries.map((entry) => entry[0]);
    const data = sortedEntries.map((entry) => entry[1]);

    output.style.display = "block";

    if (myChart) {
        myChart.destroy();
    }

    myChart = new Chart(chartContext, {
        type: "bar",
        data: {
            labels: labels,
            datasets: [
                {
                    label: "letters",
                    data: data,
                    borderWidth: 1
                }
            ]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}

function clearAll() {
    charMap.clear();
    input.value = "";
    clearUI();
}
