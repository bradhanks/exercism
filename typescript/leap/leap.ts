const isDivisibleByFourHundred = (year: number): boolean => year % 400 == 0;
const isDivisibleByHundred = (year: number): boolean => year % 100 == 0;
const isDivisibleByFour = (year: number): boolean => year % 4 == 0;
export const isLeapYear = (year: number): boolean => {
  return (
    isDivisibleByFour(year) &&
    (!isDivisibleByHundred(year) ||
      (isDivisibleByHundred(year) && isDivisibleByFourHundred(year)))
  );
};
