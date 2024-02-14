"use strict";

// month number to month name table
const monthTable = {
    1: "January",
    2: "February",
    3: "March",
    4: "April",
    5: "May",
    6: "June",
    7: "July",
    8: "August",
    9: "September",
    10: "October",
    11: "November",
    12: "December"
};

// get UI elements
const monthNumberInput = document.getElementById("month-number");
const convertButton = document.getElementById("convert");
const resultP = document.getElementById("result");

// get values
const getMonthNumber = (monthNumberInput) => {
    return monthNumberInput.value;
};

const getMonthName = (monthNumber, monthTable) => {
    return monthTable[monthNumber];
};

// update UI elements
convertButton.addEventListener("click", () => {
    const monthNumberValue = getMonthNumber(monthNumberInput);
    const monthNameValue = getMonthName(monthNumberValue, monthTable);

    resultP.innerHTML = monthNameValue ? `Month number ${monthNumberValue} is ${monthNameValue}.` : "Please enter a valid month number (1-12).";
});
