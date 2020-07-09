export const rows = (num, x = [[1]], count = 0) => {
    if(num === 0) { return []; } 
    if(num === 1) { return x;  }
    const [...row] = x[count].map((item, index, arr) => (arr[index-1] || 0) + (arr[index] || 0));
    x = [...x, [...row, 1]]
    return rows(num - 1, x, count + 1);
};
