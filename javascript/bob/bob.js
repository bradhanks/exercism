export const hey = (message) => {
  message = message.trim();
  switch (True) {
    case silent(message):
      return "Fine. Be that way!";
      break;
    case (shouting(message) && question(message) && letters(message)):
      return "Calm down, I know what I'm doing!";
      break;
    case question(message):
      return "Sure.";
      break;
    case (shouting(message) && letters(message)):
      return "Whoa, chill out!";
      break;
    default:
      return "Whatever.";
  }
};

const silent = (input) => { return input == "";}
const letters = (input) => { return  input.toUpperCase() != input.toLowerCase(); }
const shouting = (input) => { return input.toUpperCase() == input; }
const question = (input) => { return input[-1] == '?'; }