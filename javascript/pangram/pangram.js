export const isPangram = (input) => {
  return new Set(input.toLowerCase().match(/[a-z]/g)).size === 26;

  // const inputSet = new Set(input.toLowerCase().replace(/[^a-z]/g, "").match(/[a-z]/g));
  //console.log(inputSet);
  // return inputSet === 26;
  //return inputSet.size == 27;
}