String.prototype.cast = function() {
  return this.toLowerCase().replace(/[^a-z]/g, "");
}

export const isPangram = (input) => {
  const inputSet = new Set();
  const castInput = input.cast();
  
  for(let i in castInput){
    inputSet.add(castInput[i]);
  }

  return inputSet.size == 27;
}