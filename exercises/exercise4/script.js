"use strict";

const noun = document.querySelector("#noun");
const verb = document.querySelector("#verb");
const adjective = document.querySelector("#adjective");
const adverb = document.querySelector("#adverb");
const button = document.querySelector("#submit");
const madLib = document.querySelector("#mad-lib");

button.addEventListener("click", () => {
    if (noun.value && verb.value && adjective.value && adverb.value) {
        madLib.innerHTML = `You ${verb.value} your ${adjective.value} ${noun.value} ${adverb.value}? How silly!`;
        madLib.style.display = "block";
        noun.value = "";
        verb.value = "";
        adjective.value = "";
        adverb.value = "";
    }
});
