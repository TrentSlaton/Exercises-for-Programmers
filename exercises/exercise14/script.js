"use strict";

/* VERY GROSS... FIX AT SOME POINT!! */

// get UI elements
const orderAmount = document.querySelector("#order-amount");
const state = document.querySelector("#state");
const subTotal = document.querySelector("#subtotal");
const tax = document.querySelector("#tax");
const total = document.querySelector("#total");

// get UI input values
const orderAmountValue = (orderAmount) => {
    return Number(Number(orderAmount.value).toFixed(2));
};

const stateValue = (state) => {
    console.log(state.value.toLowerCase());
    return state.value.toLowerCase();
};

// calculate values
const totalWithTax = (total) => {
    const tax = 0.055;
    const ordVal = orderAmountValue(orderAmount);
    console.log(`ORDVAL: ${ordVal}`);
    console.log(`TAX: ${tax}`);
    console.log(`ORDVAL * TAX: ${ordVal * tax}`);

    if (stateValue(state) == "wi" || stateValue(state) == "wisconsin") {
        console.log(`ORDVAL + ORDVAL * TAX: ${ordVal * (ordVal * tax)}`);
        return ordVal + ordVal * tax;
    }

    return ordVal;
};

// update UI elements with updated values
orderAmount.addEventListener("input", () => {
    const input = orderAmountValue(orderAmount);

    if (!isNaN(input)) {
        subTotal.innerHTML = "$" + input;
    } else {
        subTotal.innerHTML = "$0.00";
    }
});

state.addEventListener("input", () => {
    const input = stateValue(state);

    if (stateValue(state) == "wi" || stateValue == "wisconsin") {
        tax.innerHTML = "$0.55";
        total.innerHTML = totalWithTax(total);
    } else {
        tax.innerHTML = "$0.00";
        total.innerHTML = totalWithTax(total);
    }
});
