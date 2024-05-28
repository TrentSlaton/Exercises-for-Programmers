"use strict";

const age = document.querySelector("#age");
const retirementAge = document.querySelector("#retirement-age");
const button = document.querySelector("button");
const retirement = document.querySelector("#retirement");

button.addEventListener("click", () => {
    const myAge = parseInt(age.value);
    const myRetirementAge = parseInt(retirementAge.value);
    const years = myRetirementAge - myAge;
    const date = new Date();
    const retirementYear = date.getFullYear() + years;
    retirement.innerHTML = `You can retire in ${years} years. In ${retirementYear}`;
    retirement.style.display = "block";
});
