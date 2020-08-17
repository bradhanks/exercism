const isDivisible= (dividend: number, divisor: number): boolean => dividend % divisor == 0;
export const isLeapYear = (year: number): boolean => {
  return (
    isDivisible(year, 4) &&
    (!isDivisible(year, 100) ||
      (isDivisible(year, 100) && isDivisible(year, 400)))
  );
};
