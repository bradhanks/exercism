export default class Squares {
  value: number;
  constructor(inputNum: number) {
    this.value = inputNum;
  }

  get sumOfSquares(): number {
    return (this.value * (this.value + 1 )* (2 * this.value + 1)) / 6
  }

  get squareOfSum(): number {
    return ((this.value * (this.value + 1)) / 2) ** 2;
  }

  get difference(): number {
    return this.squareOfSum - this.sumOfSquares;
  }
}
