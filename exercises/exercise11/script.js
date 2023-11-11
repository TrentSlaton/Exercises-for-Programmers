"use strict";

const euros = document.querySelector("#euros");
const xrate = document.querySelector("#xrate");
const button = document.querySelector("button");
const converted = document.querySelector("#converted");

button.addEventListener("click", () => {
    const eurosValue = parseFloat(euros.value);
    const xrateValue = parseFloat(xrate.value);
    const usd = Math.ceil(eurosValue * xrateValue * 100) / 100;

    converted.innerHTML = `${eurosValue} euros at an exchange rate of ${xrateValue} is ${usd} U.S. dollars.`;
    converted.style.display = "block";
});
