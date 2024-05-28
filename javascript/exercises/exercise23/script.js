"use strict";

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

// get answers
const getAnswers = (question) => {
    //
};

// add even listeners and update UI elements
yes.addEventListener("click", () => {
    //
    // console.log(qna[qna.length - 1]);
    console.log(qnaList);
    //console.log(qnaList[qnaList.length - 1].innerHTML);
});

no.addEventListener("click", () => {
    //
});
