export const hey = (message) => {
  message = message.trim();
  return ANSWERS
    .find(x => x.test(message))
    .answer;
};

const silent = input => input === "";
const letters = input => input.toUpperCase() !== input.toLowerCase(); 
const shouting = input => input.toUpperCase() === input; 
const question = input => input[input.length - 1] === '?'; 

const ANSWERS = [
  { answer: "Fine. Be that way!", test: silent },
  { answer: "Calm down, I know what I'm doing!", test: message => shouting(message) && question(message) && letters(message) },
  { answer: "Sure.", test: question },
  { answer: "Whoa, chill out!", test: message => shouting(message) && letters(message) },
  { answer: "Whatever.", test: () => true }
];