//
// This is only a SKELETON file for the 'Matrix' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export class Matrix {
  constructor(raw) {
    this.matrix = raw.split("\n").map(x => x.split(" ").map(x => parseInt(x)));
  }

  get rows() {
    return this.matrix;
  }

  get columns() {
    return this.matrix[0].map((_, colIndex) => this.matrix.map(row => row[colIndex]));
  }
}
