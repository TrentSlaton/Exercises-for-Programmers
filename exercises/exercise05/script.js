"use strict";

const val1 = document.querySelector("#val1");
const val2 = document.querySelector("#val2");
const button = document.querySelector("button");
const results = document.querySelector("#results");

button.addEventListener("click", () => {
    const num1 = parseFloat(val1.value);
    const num2 = parseFloat(val2.value);
    results.innerHTML = `${num1} + ${num2} = ${num1 + num2}<br>
    ${num1} - ${num2} = ${num1 - num2}<br>
    ${num1} * ${num2} = ${num1 * num2}<br>
    ${num1} / ${num2} = ${num1 / num2}`;

    results.style.display = "block";
});
