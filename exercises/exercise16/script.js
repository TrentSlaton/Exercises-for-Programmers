"use strict";

// get UI elements
const age = document.querySelector("#age");
const check = document.querySelector("#check");
const message = document.querySelector("#message");

// check age
const isOfAge = (age) => {
    return Math.floor(Number(age)) >= 16;
};

// update UI
check.addEventListener("click", () => {
    message.innerHTML = isOfAge(age.value) ? "You are old enough to legally drive" : "You are not old enough to legally drive";
});
