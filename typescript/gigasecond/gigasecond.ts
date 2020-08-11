const gigasecondsInMilliseconds: number = 10 ** 9 * 1000;

export default class Gigasecond {
  inputDate: Date;
  dateMillisecs: number;

  constructor(inputDate: Date) {
    this.inputDate = inputDate;
    this.dateMillisecs = inputDate.getTime();
  }

  static gigasecondsInMilliseconds: number = 10 ** 9 * 1000;

  date = (): Date => new Date(this.dateMillisecs + gigasecondsInMilliseconds);
}
