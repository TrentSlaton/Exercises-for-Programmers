"use strict";

const charMap = new Map();
const input = document.getElementById("input");
const output = document.getElementById("output");
// const count = document.getElementById("count");
const clear = document.getElementById("clear");
const ctx = document.getElementById("myChart");

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
    // count.innerHTML = "";
    input.value = "";
    myChart.destroy();
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
    console.log(sortedEntries);
    const labels = sortedEntries.map((entry) => entry[0]);
    const data = sortedEntries.map((entry) => entry[1]);
    console.log("labels", labels);
    console.log("data", data);
    // count.innerHTML = "";
    // for (let [key, value] of sortedEntries) {
    //     count.innerHTML += `${key}: ${value}<br>`;
    // }

    output.style.display = "block";
    // count.style.display = "block";

    if (myChart) {
        console.log("hey");
        myChart.destroy();
    }

    myChart = new Chart(ctx, {
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
