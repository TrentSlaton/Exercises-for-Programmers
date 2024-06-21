"use strict";

// get UI elements
const rate = document.getElementById("rate");
const check = document.getElementById("check");
const result = document.getElementById("result");

// get rate
const getRate = (rate) => {
    const rateVal = parseInt(rate.value.trim());

    if (isNaN(rateVal) || rateVal === 0) {
        return NaN;
    }

    const double = 72 / rateVal;

    return Math.abs(double);
};

// add event listeners and update UI elements
check.addEventListener("click", () => {
    const double = getRate(rate);

    if (!isNaN(double)) {
        result.innerHTML = `${double}`;
    } else {
        result.innerHTML = "Enter a valid rate.";
    }
});
