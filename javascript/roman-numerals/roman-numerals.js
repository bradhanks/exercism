//Functional programming approach

'use strict';

export const convertArr = deepFreeze(
  [{1000: "M" },
  {  900:"CM"},
  {  500: "D" },
  {  400: "CD"},
  {  100: "C" },
  {   90: "XC"},
  {   50: "L" },
  {   40: "XL"},
  {   10: "X" },
  {    9: "IX"},
  {    5: "V" },
  {    4: "IV"},
  {    1: "I" } ]);

export const toRoman = (num) => {
  const roman = "";
  const index = 0;
  const firstObj = deepFreeze(convertArr[index]);
  const firstNum = Object.keys(firstObj)[0]; //hardcoded because object only has one property
  const firstRom = firstObj[firstNum]; //use property to get Roman number conversion value

  return checkNext(num, roman, firstNum, firstRom, index);
};

export const checkNext = (num, roman, nextNum, nextRom, index) => {
  if (num == 0) {return '';}
  
  return nextNum <= num ? build(num, roman, nextNum, nextRom, index) 
                        : getNext(num, roman, nextNum, nextRom, index);
};

export const build = (num, roman, nextNum, nextRom, index) => {
  num = num - nextNum;
  roman = roman + nextRom;

  return num == 0 ? roman : checkNext(num, roman, nextNum, nextRom, index);
}

export const getNext = (num, roman, nextNum, nextRom, index) => {
  index += 1;
  const nextObj = Object.freeze(convertArr[index]);
  nextNum = Object.keys(nextObj)[0];
  nextRom = nextObj[nextNum];

  return checkNext(num, roman, nextNum, nextRom, index); // account for 0
};

function deepFreeze(object) {

  // Retrieve the property names defined on object
  var propNames = Object.getOwnPropertyNames(object);

  // Freeze properties before freezing self
  
  for (let name of propNames) {
    let value = object[name];

    if(value && typeof value === "object") { 
      deepFreeze(value);
    }
  }

  return Object.freeze(object);
}






