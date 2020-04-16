/*
// This is only a SKELETON file for the 'Leap' exercise. It's been provided as a
// convenience to get you started writing code faster.
on every year that is evenly divisible by 4
  except every year that is evenly divisible by 100
    unless the year is also evenly divisible by 400

*/

export const isLeap = (year) => {
  return year%4 == 0 ? checkH(year) : false;
};

export const checkH = (year) => {
  return year%100 == 0 ? checkF(year) : true;
 };
export const checkF = (year) => {
  return year%400 == 0 ? true : false;
};
