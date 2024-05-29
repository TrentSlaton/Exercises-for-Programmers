"use strict";

// get UI elements
const body = document.body;
const qna = document.getElementById("qna");
let qnaList = (() => {
    const qnaList = [];
    const elements = [...document.getElementById("qna").getElementsByTagName("li")];

    elements.forEach((el) => {
        qnaList.push(el.innerHTML.trim());
    });

    return qnaList;
})();
const yes = document.getElementById("yes");
const no = document.getElementById("no");

// prompts
const carSilent = "Is the car silent when you turn the key?";
const batteryTerminals = "Are the battery terminals corroded?";
const clickingNoise = "Does the car make a clicking noise?";
const crankNoStart = "Does the car crank up but fail to start?";
const startThenDie = "Does the engine start and then die?";
const haveFuelInjection = "Does your car have fuel injection?";

// update qnaList
const updateqnaList = (oldqnaList, response) => {
    const lastItem = oldqnaList[oldqnaList.length - 1];
    let newItem = "";

    if (lastItem.includes(carSilent)) {
        if (response === "yes") {
            newItem = batteryTerminals;
        } else {
            newItem = clickingNoise;
        }
    } else if (lastItem.includes(batteryTerminals)) {
        if (response === "yes") {
            newItem = "Clean the terminals and try starting again.";
            removeYesNoButtons();
        } else {
            newItem = "Replace cables and try again.";
            removeYesNoButtons();
        }
    } else if (lastItem.includes(clickingNoise)) {
        if (response === "yes") {
            newItem = "Replace the battery.";
            removeYesNoButtons();
        } else {
            newItem = crankNoStart;
        }
    } else if (lastItem.includes(crankNoStart)) {
        if (response === "yes") {
            newItem = "Check spark plug connections.";
            removeYesNoButtons();
        } else {
            newItem = startThenDie;
            no.remove();
        }
    } else if (lastItem.includes(startThenDie)) {
        if (response === "yes") {
            newItem = haveFuelInjection;
            body.appendChild(no);
        }
    } else if (lastItem.includes(haveFuelInjection)) {
        if (response === "yes") {
            newItem = "Get it in for service.";
            removeYesNoButtons();
        } else {
            newItem = "Check to ensure the choke is opening and closing.";
            removeYesNoButtons();
        }
    }

    const li = document.createElement("li");
    const p = document.createElement("p");

    p.textContent = newItem;
    li.appendChild(p);
    qna.appendChild(li);

    return [...oldqnaList, newItem];
};

// remove yes/no buttons
const removeYesNoButtons = () => {
    yes.remove();
    no.remove();
};

// add event listeners and update UI elements
yes.addEventListener("click", () => {
    qnaList = updateqnaList(qnaList, "yes");
});

no.addEventListener("click", () => {
    qnaList = updateqnaList(qnaList, "no");
});
