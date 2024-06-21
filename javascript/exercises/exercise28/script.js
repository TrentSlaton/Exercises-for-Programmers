"use strict";

/* Needs work! */

// get UI elements
const nums = document.getElementById("nums");
const enter = document.getElementById("enter");
const numsList = document.getElementById("nums-list");
const result = document.getElementById("result");

// get nums
const getNums = () => {
    const numbers = parseInt(nums.value.trim());

    if (isNaN(numbers)) {
        return NaN;
    }

    return Math.abs(Math.trunc(numbers));
};

// calculate sum
const calculateSum = () => {
    let sum = 0;
    const liItems = numsList.querySelectorAll("li");

    liItems.forEach((li) => {
        const input = li.querySelector("input[type='number'");
        if (input) {
            sum += parseInt(input.value) || 0;
        }
    });

    result.innerHTML = `${sum}`;
};

// add event listeners and update UI elements
enter.addEventListener("click", () => {
    const numbers = getNums();

    if (!isNaN(numbers)) {
        numsList.innerHTML = "";

        for (let count = 0; count < numbers; count++) {
            const li = document.createElement("li");
            const input = document.createElement("input");
            input.type = "number";
            input.placeholder = `${count + 1}`;
            li.appendChild(input);
            numsList.appendChild(li);
        }

        const add = document.createElement("button");
        add.textContent = "Add!";
        add.addEventListener("click", calculateSum);
        numsList.appendChild(add);
    }

    result.innerHTML = `${numbers}`;
});
