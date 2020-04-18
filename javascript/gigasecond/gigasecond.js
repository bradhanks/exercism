const gigasecondsInMilliseconds = 10**9 * 1000;

export const gigasecond = (date) => {
  let dateMilliecs = date.getTime();
  return new Date(dateMilliecs + gigasecondsInMilliseconds); 
};