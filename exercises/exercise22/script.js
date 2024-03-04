"use strict";

// get UI elements
const numbersList = document.getElementById("numbers_list");
const listItems = numbersList.querySelectorAll('input[type="number"]');
const findLargestButton = document.getElementById("find-largest");
const resultP = document.getElementById("result");

// get values
const getNums = (listItems) => {
  const nums = [];

  Array.from(listItems).forEach((item) => {
    const number = parseFloat(item.value);
    if (!isNaN(number)) {
      nums.push(number);
    }
  });

  return nums;
}

const findLargest = (numsList) => {
  let largest = -Infinity;

  numsList.forEach((num) => {
    if (num > largest) {
      largest = num;
    }
  });

  return largest;
}

// update UI elements
findLargestButton.addEventListener("click", () => {
  const nums = getNums(listItems);
  const largest = findLargest(nums);

  resultP.innerHTML = nums.length > 2 ? largest : "You must enter at least three numbers.";
});
