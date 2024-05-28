"use strict";

// get UI elements
const orderInput = document.getElementById("order");
const stateInput = document.getElementById("state");
const countyInput = document.getElementById("county");
const countyWrapper = document.getElementById("county-wrapper");
const calculateButton = document.getElementById("calculate");
const taxP = document.getElementById("tax");
const totalP = document.getElementById("total");

// get input ... repeated code, can generalize this and getStateValue()
const getOrderValue = (oInput) => {
    return parseFloat(Number(oInput.value).toFixed(2));
};

const getStateValue = (sInput) => {
    return sInput.value.trim().toLowerCase();
};

const getCountyValue = (cInput) => {
    return cInput.value.trim().toLowerCase();
};

// calculate tax ... more repeated code, can generalize
const getStateTax = (state) => {
    if (state == "wi" || state == "wisconsin") {
        return 0.05;
    } else if (state == "il" || state == "illinois") {
        return 0.08;
    }

    return 0;
};

const getCountyTax = (county) => {
    if (county == "eau claire") {
        return 0.005;
    } else if (county == "dunn") {
        return 0.004;
    }

    return 0;
};

const getTotalAmount = (amount, stateTax, countyTax) => {
    const amountValue = Number.parseFloat(amount);
    const stateTaxAmount = amountValue * stateTax;
    const countyTaxAmount = amountValue * countyTax;

    return amountValue + stateTaxAmount + countyTaxAmount;
};

// update UI elements
state.addEventListener("input", () => {
    const stateValue = getStateValue(stateInput);

    if (stateValue == "wi" || stateValue == "wisconsin") {
        countyWrapper.style.display = "block";
    } else {
        countyWrapper.style.display = "none";
    }
});

calculateButton.addEventListener("click", () => {
    const orderValue = getOrderValue(orderInput);
    const stateValue = getStateValue(stateInput);
    const countyValue = getCountyValue(countyInput);
    const stateTax = getStateTax(stateValue);
    const countyTax = getCountyTax(countyValue);
    const totalAmount = getTotalAmount(orderValue, stateTax, countyTax);

    if (stateTax + countyTax != 0) {
        taxP.innerHTML = `Tax: ${(orderValue * stateTax + orderValue * countyTax).toFixed(2)}`;
    }

    totalP.innerHTML = `Total: ${totalAmount.toFixed(2)}`;
});
