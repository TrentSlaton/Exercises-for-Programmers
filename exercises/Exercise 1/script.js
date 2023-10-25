"use strict";

import { fetchCookie } from "./cookie.js";

// Cache DOM elements.
const nameInput = document.getElementById("name");
const helloName = document.getElementById("hello_name");
const submit = document.getElementById("submit");
const modal = document.getElementById("modal");
const closeModalButton = document.getElementById("close-modal");

// Add Event Listeners to DOM elements.
document.addEventListener("keyup", function (event) {
    if (event.key === "Escape") {
        closeModal();
    }
});

nameInput.addEventListener("keyup", function (event) {
    if (event.key === "Enter") {
        displayMessage();
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
            if (cookie !== null) {
                helloName.textContent = `Hello, ${nameInput.value}! ${cookie.answer}`;
            } else {
                helloName.textContent = `Hello, ${nameInput.value}! (No cookie available)`;
            }
            modal.style.display = "block";
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
}

// Load the cat fact when the page loads
// loadCatFact();

// const cookie = fetchCookie();
