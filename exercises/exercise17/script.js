"use strict";

// get UI elements
const weight = document.querySelector("#weight");
const gender = document.querySelector("#gender");
const drinks = document.querySelector("#drinks");
const abv = document.querySelector("#abv");
const lastDrink = document.querySelector("#lastdrink");
const check = document.querySelector("#check");
const message = document.querySelector("#message");

// calculate BAC
// BAC = (A × 5.14 / W × r) − .015 × H
// A is total alcohol consumed in ounces
// W is weight in pounds
// r is alcohol distribution ratio: 0.73 for men, 0.66 for women
// H is number of hours since last drink
const bac = () => {
    // const A = parseFloat(drinks.value) * (parseFloat(abv.value) / 100);
    const A = parseFloat(drinks.value) * parseFloat(abv.value);
    const W = parseFloat(weight.value);
    const r = parseFloat(gender.value) === "male" ? 0.73 : 0.66;
    const H = parseFloat(lastDrink.value);

    // producing weird results... i think it has to do with A. i must not be calculating it correctly...
    return ((A * 5.14) / W) * r - 0.015 * H;
};

check.addEventListener("click", () => {
    const BAC = bac();
    console.log(BAC);
    message.innerHTML = BAC >= 0.08 ? "You are too drunk to drive." : "You are sober enough to drive.";
});
