//
// This is only a SKELETON file for the 'Armstrong numbers' exercise. It's been provided as a
// convenience to get you started writing code faster.
//a number that is the sum of its own digits each raised to the power of the number of digits

export const isArmstrongNumber = (num) => {
  let numString = JSON.stringify(num);
  let i = 0, x = 0;
  while(numString[i]){
    x += Math.pow(parseInt(numString[i]), numString.length);
    console.log(x); 
    i++;
  }
  console.log(num, Math.pow(x,numString.length), x, numString.length, );
  return num == x;
};
