"use strict";

// get UI elements
const password = document.getElementById("pw");
const check = document.getElementById("check");
const result = document.getElementById("result");

// check pw strength
const pwStrength = (password) => {
    const pwLength = password.length;

    if (password.length == 0) {
        return "empty";
    } else if (pwLength < 8 && /^\d+$/.test(password)) {
        return "very weak";
    } else if (pwLength < 8 && /^[a-zA-Z]+$/.test(password)) {
        return "weak";
    } else if (pwLength >= 8 && /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).+$/.test(password)) {
        return "very strong";
    } else if (pwLength >= 8 && /^(?=.*[a-zA-Z])(?=.*\d).+$/.test(password)) {
        return "strong";
    }
};

// add event listeners and update UI elements
check.addEventListener("click", () => {
    const pw = password.value;
    const strength = pwStrength(pw);
    console.log(strength);

    if (strength == "empty") {
        result.innerHTML = "You must enter a password.";
    } else {
        result.innerHTML = `${pw} is a ${strength} password`;
    }
});
