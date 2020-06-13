//
// This is only a SKELETON file for the 'Difference Of Squares' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export class Squares {
  constructor(num) {
    this.num = num;
    this.range = [...Array(num+1).keys()];
  }

  get sumOfSquares() {
    return this.range.reduce((x,y) => x + y**2);
  }

  get squareOfSum() {
    return (this.num * (this.num + 1) / 2) ** 2;
  }

  get difference() {
    return this.squareOfSum - this.sumOfSquares;
  }
}
