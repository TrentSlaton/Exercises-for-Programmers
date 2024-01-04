"use strict";

import { fetchCookie } from "./cookie.js";

// Cache DOM elements.
const nameInput = document.getElementById("name");
const helloName = document.querySelector("#hello_name > p.greet");
const fortune = document.querySelector("#hello_name > p.fortune");
const submit = document.getElementById("submit");
const modal = document.getElementById("modal");
const closeModalButton = document.getElementById("close-modal");

// Add Event Listeners to DOM elements.
nameInput.addEventListener("keyup", function (event) {
    if (event.key === "Enter") {
        displayMessage();
    }
});

document.addEventListener("keyup", function (event) {
    if (event.key === "Escape") {
        closeModal();
    }
});

submit.addEventListener("click", displayMessage);

closeModalButton.addEventListener("click", closeModal);

// Define functions.
async function displayMessage() {
    const inputText = nameInput.value.trim();
    if (inputText !== "") {
        try {
            const cookie = await fetchCookie();
            if (!cookie.error) {
                helloName.innerHTML = `Hello, ${nameInput.value}!`;
                fortune.innerHTML = `${cookie.data.message}`;
            } else {
                helloName.innerHTML = `Aw shucks, ${nameInput.value}...`;
                fortune.innerHTML = `We ran out of fortune cookies :(`;
            }
            modal.style.display = "block";
            closeModalButton.focus();
        } catch (error) {
            console.log(error);
        }
    } else {
        nameInput.value = "";
    }
}

function closeModal() {
    nameInput.value = "";
    modal.style.display = "none";
    nameInput.focus();
}
