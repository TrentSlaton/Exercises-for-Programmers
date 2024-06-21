"use strict";

/* KNOWN BUG: NaN will return if balance is too high and the payment is too low... */

// get UI elements
const balance = document.getElementById("balance");
const apr = document.getElementById("apr");
const payment = document.getElementById("payment");
const check = document.getElementById("check");
const result = document.getElementById("result");

// calculate term in months
const months = (balance, apr, payment) => {
    balance = balance || 0;
    apr = apr || 0;
    payment = payment || 0;

    if (balance <= 0 || isNaN(balance)) {
        return "Balance must be a positive number.";
    }

    if (apr <= 0 || isNaN(apr)) {
        return "APR must be a positive number.";
    }

    if (payment <= 0 || isNaN(payment)) {
        return "Payment must be a positive number.";
    }

    apr = apr / 100 / 365;

    const scalar = -1 / 30;

    const a = (1 + apr) ** 30;
    const aa = 1 - a;
    const b = balance / payment;
    const c = b * aa;
    const d = 1 + c;
    const numer = Math.log(d);
    const denom = Math.log(1 + apr);
    const final = scalar * (numer / denom);

    // console.log(final);

    // console.log(a);
    // console.log(aa);
    // console.log(b);
    // console.log(c);
    // console.log("d:" + d);
    // console.log(numer);
    // console.log(denom);
    // console.log(Math.ceil(final));

    return Math.ceil(final);
};

// add event listeners and update UI elements
check.addEventListener("click", () => {
    const res = months(balance.value, apr.value, payment.value);

    if (typeof res === "number") {
        result.innerHTML = `It will take ${res} months to pay off this debt.`;
    } else {
        result.innerHTML = res;
    }
});
