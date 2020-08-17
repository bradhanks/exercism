export default class Gigasecond {
  value: Date;

  constructor(startDate: Date) {
    this.value = startDate;
  }

  private static gigaseconds: number = 10 ** 9;

  private dateInMilliseconds = (): number => this.value.getTime();
  private gigasecsInMillisecs = () : number => Gigasecond.gigaseconds * 1000;

  date = (): Date => new Date(this.dateInMilliseconds() + this.gigasecsInMillisecs());
}
