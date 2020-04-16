

export const gigasecond = (date) => {
  let dateMilliecs = date.getTime();
  let addMillisecs = Math.pow(10,9) * 1000;
  let newDateMillisecs = dateMilliecs + addMillisecs; 
  let newDate = new Date(newDateMillisecs);
  // date.setUTCMonth(10); // Fun with mutation
  return newDate;

};