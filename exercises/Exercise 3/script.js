"use strict";

const quote = document.getElementById("quote");
const source = document.getElementById("source");
const submit = document.getElementById("submit");
const dialog = document.querySelector("dialog");
const sourceQuote = document.getElementById("source-quote");
const blockQuote = document.querySelector("blockquote");
const cool = document.getElementById("cool");

const result = document.querySelector(".result");

quote.addEventListener("input", processInput);
source.addEventListener("input", processInput);
submit.addEventListener("click", submitInput);
cool.addEventListener("click", closeModal);

function processInput(event) {
    if (!checkInput()) {
        return;
    }

    if (event.key == "Enter") {
    }
}

function submitInput() {
    if (!checkInput()) {
        return;
    }

    /*
        TODO
            strip leading and trailing quotation marks if any
            trim string
    */
    sourceQuote.innerHTML = source.value + " says, ";
    blockQuote.innerHTML = '"' + quote.value + '"';
    source.value = "";
    quote.value = "";
    result.style.display = "block";
    result.style.opacity = 1;
    document.querySelector(".content").classList.add("show-result");
}

function checkInput() {
    return quote.value.length > 0 && source.value.length > 0;
}

function closeModal() {
    result.style.opacity = 0;
    setTimeout(() => {
        sourceQuote.innerHTML = "";
        blockQuote.innerHTML = "";
        result.style.display = "none";
    }, 1000);
    document.querySelector(".content").classList.remove("show-result");
}
