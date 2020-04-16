var object = {black: 0, brown: 1, red: 2, orange: 3, yellow: 4, green: 5, blue: 6, violet: 7, grey: 8, white: 9};


export const colorCode = (color) => {
  return object[color];
};

export const COLORS = Object.keys(object);

export const decodedValue = ([tens, ones]) => {   //<-- JS is lazy: don't need [first, second, ...arr]
  let num = colorCode(tens)*10 + colorCode(ones);
  return num; 
};
