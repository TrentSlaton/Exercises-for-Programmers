"use strict";

const CONVERSION_FACTOR = 0.09290304;

const width = document.querySelector("#width");
const widthUnits = document.querySelector("#width-units");
const length = document.querySelector("#length");
const lengthUnits = document.querySelector("#length-units");
const button = document.querySelector("button");
const area = document.querySelector("#area");

button.addEventListener("click", () => {
    const w = parseInt(width.value);
    const l = parseInt(length.value);
    if (w >= 0 && l >= 0) {
        const widthFeet = (widthUnits.value == "feet" ? w : calculateFeet(w)).toFixed(2);
        const widthMeters = (widthUnits.value == "meters" ? w : calculateMeters(w)).toFixed(2);
        const lengthFeet = (lengthUnits.value == "feet" ? l : calculateFeet(l)).toFixed(2);
        const lengthMeters = (lengthUnits.value == "meters" ? l : calculateMeters(l)).toFixed(2);
        const areaFeet = (widthFeet * lengthFeet).toFixed(2);
        const areaMeters = (widthMeters * lengthMeters).toFixed(2);

        area.innerHTML = `Area in feet: ${areaFeet}<br>
        Area in meters: ${areaMeters}`;
        area.style.display = "block";
    }
});

function calculateMeters(feet) {
    return Math.sqrt(feet * CONVERSION_FACTOR);
}

function calculateFeet(meters) {
    return Math.sqrt(meters / CONVERSION_FACTOR);
}
