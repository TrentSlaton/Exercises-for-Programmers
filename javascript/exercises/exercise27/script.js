"use strict";

// get UI elements
const form = document.getElementById("employee-form");
const firstName = document.getElementById("first-name");
const lastName = document.getElementById("last-name");
const zipCode = document.getElementById("zip-code");
const empIDPre = document.getElementById("employee-id-prefix");
const empIDSuff = document.getElementById("employee-id-suffix");
const submit = document.getElementById("submit");
const result = document.getElementById("result");

// add event listeners and update UI elements
form.addEventListener("submit", (event) => {
    event.preventDefault();
    result.innerHTML = `${firstName.value} ${lastName.value}<br>ZIP: ${zipCode.value}<br>Employee ID: ${empIDPre.value.toUpperCase()}-${empIDSuff.value}`;
});
