export const rows = (num, x = [], count = 0) => {
  if(num == 0) {return x;} 
  x[count] = [];
  for(let i = 0; x[count].length < count; i++){
    x[count].push(
                  (x[count-1][i-1] | 0) + 
                  (x[count-1][i]   | 0)
                 );
  }
  x[count].push(1);
  return rows(num - 1, x, count + 1);
};
