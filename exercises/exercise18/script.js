"use strict";

// get UI elements
const temp = document.querySelector("#temp");
const units = document.querySelector("#units");
const convert = document.querySelector("#convert");
const message = document.querySelector("#message");

// convert temp
const convertTemp = (temp, units) => {
    if (units == "Fahrenheit") {
        return ((temp - 32) * 5) / 9;
    } else {
        return (temp * 9) / 5 + 32;
    }
};

// update UI elements
convert.addEventListener("click", () => {
    const currentTemp = temp.value;
    const currentUnits = units.value;
    const convertedTemp = Math.round(convertTemp(currentTemp, currentUnits));

    message.innerHTML = `${currentTemp} degrees ${currentUnits} is ${convertedTemp} degrees ${currentUnits == "Fahrenheit" ? "Celsius" : "Fahrenheit"} (rounded)`;
});
