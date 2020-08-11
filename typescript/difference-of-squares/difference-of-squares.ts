export default class Squares {
  number: number;
  range: number[];
  constructor(number: number) {
    this.number = number;
    this.range = [...Array(number + 1).keys()];
  }

  get sumOfSquares(): number {
    return this.range.reduce((x: number, y: number) => x + y ** 2);
  }

  get squareOfSum(): number {
    return ((this.number * (this.number + 1)) / 2) ** 2;
  }

  get difference(): number {
    return this.squareOfSum - this.sumOfSquares;
  }
}
