"use strict";

// get UI elements
const heightInput = document.getElementById("height");
const weightInput = document.getElementById("weight");
const calculateButton = document.getElementById("calculate");
const messageP = document.getElementById("message");

// calculate BMI
// bmi = (weight / (height × height)) * 703
const calculateBMI = (heightInput, weightInput) => {
    const height = heightInput.value;
    const weight = weightInput.value;

    return (weight / (height * height)) * 703;
};

// determine weight category
const determineWeightCategory = (BMI) => {
    if (BMI < 18.5) {
        return "You are underweight.";
    } else if (BMI > 25) {
        return "You are overweight.";
    } else {
        return "You are in a healthy weight range.";
    }
};

// update UI elements
calculateButton.addEventListener("click", () => {
    const calculatedBMI = calculateBMI(heightInput, weightInput).toFixed(2);
    const weightCategoryMessage = determineWeightCategory(Number(calculatedBMI));

    messageP.innerHTML = `Your BMI is ${calculatedBMI}. ` + weightCategoryMessage;
});
