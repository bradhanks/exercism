export const rows = (num, x = [], count = 0) => {
    if(num === 0) {return x;} 
    let row = [];
    for(let i = 0; row.length < count; i++){
      row = [...row, (x[count-1][i-1] || 0) + (x[count-1][i] || 0)];
    }
    x = [...x, [...row, 1]]
    return rows(num - 1, x, count + 1);

};
