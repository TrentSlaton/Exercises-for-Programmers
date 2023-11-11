"use strict";

const principal = document.querySelector("#principal");
const rate = document.querySelector("#rate");
const term = document.querySelector("#term");
const period = document.querySelector("#period");
const button = document.querySelector("button");
const balance = document.querySelector("#balance");

button.addEventListener("click", () => {
    const principalValue = parseFloat(principal.value);
    const rateValue = parseFloat(rate.value) / 100;
    const termValue = parseInt(term.value);
    const periodValue = parseInt(period.value);
    const compoundInterest = +calcSimpleInterest(principalValue, rateValue, termValue, periodValue).toFixed(2);

    balance.innerHTML = `After ${termValue} years at ${rateValue}%, the investment will be worth $${compoundInterest}.`;
    balance.style.display = "block";
});

function calcSimpleInterest(principal, rate, term, period) {
    return principal * Math.pow(1 + rate / period, period * term);
}
