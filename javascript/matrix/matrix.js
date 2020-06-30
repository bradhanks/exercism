import { transpose } from 'mathjs'
const parseRow = row => row.split(' ').map(Number);
const parseRows = rows => rows.split("\n").map(parseRow);

const parseColumn = column => column.split("\n").map(parseRow);



export class Matrix {
  constructor(raw) { this.raw = raw; }

  get rows() {
    return this._rows_ = this._rows_ ||  parseRows(this.raw);
  }

  get columns() {
    return  this._columns_ = this._columns_ || transpose(this.rows);
  }
}
