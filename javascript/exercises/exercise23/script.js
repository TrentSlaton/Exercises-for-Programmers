"use strict";

/*

So I haven't gotten this working yet, but the idea is to implement some functional programming here... I want to initialize the the DOM elements to the initial question and then have event listeners on the yes/no buttons that will call the update DOM function, which will take in the old DOM and return the updated DOM...

Both the "yes" and "no" buttons will call the same function, but with "yes" and "no" parameters respectively. That function will perform a switch or if statement on the last element of the ul and see if it includes the various phrases ("Does the car make a clicking noise?" or "Does your car have fuel injection?") and based on the response of "yes" or "no", it will update the DOM accordingly.

Updating the DOM will be done by taking in the old DOM, making a copy of it, and appending the new question to the copy and returning that.

*/

// get UI elements
const qna = document.getElementById("qna");
const qnaList = (() => {
    const qnaList = [];
    const elements = [...document.getElementById("qna").getElementsByTagName("li")];

    elements.forEach((el) => {
        qnaList.push(el.innerHTML.trim());
    });

    return qnaList;
})();
const yes = document.getElementById("yes");
const no = document.getElementById("no");

// update qnaList
const updateqnaList = (oldqnaList, response) => {
    //
    let newItem;
    const qnaList = [...oldqnaList];
    if (oldqnaList[oldqnaList.length - 1].includes("Is the car silent when you turn the key?")) {
        newItem = "";
    }

    return [...oldqnaList, newItem];
};

// add event listeners and update UI elements
yes.addEventListener("click", () => {
    //
    // console.log(qnaList[qnaList.length - 1].innerHTML);
    // qnaList = updateqnaList(qnaList, "yes");
    updateqnaList(qnaList, "yes");
});

no.addEventListener("click", () => {
    //
    updateqnaList(qnaList, "yes");
});
