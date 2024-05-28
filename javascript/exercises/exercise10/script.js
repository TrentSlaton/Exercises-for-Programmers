"use strict";

const TAX_RATE = 0.055;

const item1Qty = document.querySelector("#item1-qty");
const item1Price = document.querySelector("#item1-price");
const item2Qty = document.querySelector("#item2-qty");
const item2Price = document.querySelector("#item2-price");
const item3Qty = document.querySelector("#item3-qty");
const item3Price = document.querySelector("#item3-price");
const button = document.querySelector("button");
const receipt = document.querySelector("#receipt");

button.addEventListener("click", () => {
    const item1Q = parseInt(item1Qty.value);
    const item1P = parseFloat(item1Price.value).toFixed(2);
    const item2Q = parseInt(item2Qty.value);
    const item2P = parseFloat(item2Price.value).toFixed(2);
    const item3Q = parseInt(item3Qty.value);
    const item3P = parseFloat(item3Price.value).toFixed(2);

    const item1Total = item1Q * item1P;
    const item2Total = item2Q * item2P;
    const item3Total = item3Q * item3P;

    const subTotal = item1Total + item2Total + item3Total;
    const tax = +(subTotal * TAX_RATE).toFixed(2);
    const total = subTotal + tax;

    receipt.innerHTML = `Subtotal: ${subTotal}<br>
    Tax: ${tax}<br>
    Total: ${total}`;

    receipt.style.display = "block";

    const number = 5.123;
    const roundedUpNumber = Math.ceil(number * 100) / 100;
    console.log(roundedUpNumber); // 5.13
});
