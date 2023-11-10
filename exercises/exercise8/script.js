"use strict";

const people = document.querySelector("#people");
const pizzas = document.querySelector("#pizzas");
const slices = document.querySelector("#slices");
const button = document.querySelector("button");
const distribution = document.querySelector("#distribution");

button.addEventListener("click", () => {
    const ppl = parseInt(people.value);
    const totalSlices = parseInt(pizzas.value) * parseInt(slices.value);

    if (ppl <= 0 || totalSlices <= 0) {
        return;
    }
    const each = Math.floor(totalSlices / ppl);
    const leftOver = totalSlices % ppl;

    distribution.innerHTML = `Each person gets ${each} slices each.<br>
        There are ${leftOver} slices left over.`;
    distribution.style.display = "block";
});
