"use strict";

const CONVERSION_FACTOR = 0.09290304;
const BUCKET_AREA = 350;

const width = document.querySelector("#width");
const widthUnits = document.querySelector("#width-units");
const length = document.querySelector("#length");
const lengthUnits = document.querySelector("#length-units");
const button = document.querySelector("button");
const buckets = document.querySelector("#buckets");

button.addEventListener("click", () => {
    const w = parseInt(width.value);
    const l = parseInt(length.value);
    if (w >= 0 && l >= 0) {
        const widthFeet = widthUnits.value == "feet" ? w : calculateFeet(w);
        const widthMeters = widthUnits.value == "meters" ? w : calculateMeters(w);
        const lengthFeet = lengthUnits.value == "feet" ? l : calculateFeet(l);
        const lengthMeters = lengthUnits.value == "meters" ? l : calculateMeters(l);
        const areaFeet = (widthFeet * lengthFeet).toFixed(2);
        const areaMeters = (widthMeters * lengthMeters).toFixed(2);

        const bucks = Math.ceil(areaFeet / BUCKET_AREA);

        buckets.innerHTML = `Area in feet: ${areaFeet}<br>
        Area in meters: ${areaMeters}<br>
        Buckets needed: ${bucks}`;
        buckets.style.display = "block";
    }
});

function calculateMeters(feet) {
    return Math.sqrt(feet * CONVERSION_FACTOR);
}

function calculateFeet(meters) {
    return Math.sqrt(meters / CONVERSION_FACTOR);
}
