"use strict";

const principal = document.querySelector("#principal");
const rate = document.querySelector("#rate");
const term = document.querySelector("#term");
const button = document.querySelector("button");
const balance = document.querySelector("#balance");

button.addEventListener("click", () => {
    const principalValue = parseFloat(principal.value);
    const rateValue = parseFloat(rate.value) / 100;
    const termValue = parseInt(term.value);
    const simpleInterest = calcSimpleInterest(principalValue, rateValue, termValue);

    balance.innerHTML = `After ${termValue} years at ${rateValue}%, the investment will be worth $${simpleInterest}.`;
    balance.style.display = "block";
});

function calcSimpleInterest(principal, rate, term) {
    return principal * (1 + rate * term);
}
