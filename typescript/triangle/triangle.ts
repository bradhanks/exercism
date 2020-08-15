export default class Triangle {
  sides: [number, number, number];

  constructor(...sides: [number, number, number]) {
    this.sides = sides;
  }

  kind(): string {
    this.isValid();
    if (this.isEquilateral()) return "equilateral";
    if (this.isIsosceles()) return "isosceles";
    if (this.isScalene()) return "scalene";

    return "";
  }

  isEquilateral(): boolean {
    return (
      this.sides[0] === this.sides[1] &&
      this.sides[1] == this.sides[2] &&
      this.sides[2] == this.sides[0]
    );
  }

  isIsosceles(): boolean {
    return !this.isScalene() && !this.isEquilateral();
  }

  isScalene() {
    return (
      this.sides[0] != this.sides[1] &&
      this.sides[0] != this.sides[2] &&
      this.sides[1] != this.sides[2]
    );
  }

  isValid() {
    let newArr = this.sides.sort((a, b) => a - b);
    if (newArr[0] <= 0) {
      throw new Error("Not valid!");
    }
    if (newArr[0] + newArr[1] <= newArr[2]) {
      throw new Error("Not valid!");
    }
  }
}
