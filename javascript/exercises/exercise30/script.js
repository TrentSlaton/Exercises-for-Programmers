"use strict";

const obj1 = {
    a: 5,
    b: "hello",
    c: true,
    d: { inner: "heyehy" }
};

const obj2 = { ...obj1, a: 4 };

console.log(obj1);

obj1.d["inner"] = "hoho";

console.log(obj2);

// // get UI elements
// const table = document.getElementById("table");

// const makeTable = () => {
//     const divArr = new Array(12);
//     for (let i = 0; i < 12; i++) {
//         divArr[i] = new Array(14);
//     }

//     for (let i = 0; i < 13; i++) {
//         for (let j = 0; j < 13; j++) {
//             const cell = document.createElement("div");
//             cell.className = "cell";
//             cell.textContent = i * j;
//             table.appendChild(cell);
//         }
//     }

//     // for (let i = 0; i < 14; i++) {
//     //     for (let j = 0; j < 14; j++) {
//     //         const cell = document.createElement("div");
//     //         cell.className = "cell";
//     //         cell.textContent = i * j;
//     //         table.appendChild(cell);
//     //     }
//     // }
// };

// makeTable();
